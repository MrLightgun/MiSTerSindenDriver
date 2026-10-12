#!/usr/bin/env python3
"""Read (and optionally rewrite) Sinden Lightgun settings over serial.

Useful when the official software refuses to start - notably after a camera
module swap, where it loops a "Cannot find the camera ..." dialog and never lets
you reach the firmware tab to fix the very setting it is complaining about.

Protocol: fixed 7-byte frame  AA cmd p1 p2 p3 p4 BB  at 115200 baud.
Stop the Sinden software/driver first or the port returns EBUSY.

  python3 gun_serial.py /dev/ttyACM0
  python3 gun_serial.py COM5 --set-camera SindenCamC
"""
import argparse, sys, time
try:
    import serial
except ImportError:
    sys.exit("needs pyserial:  python3 -m pip install pyserial")

READ, WRITE, FW, CAL_X, CAL_Y = 102, 103, 101, 104, 105

def frame(cmd, p=(0, 0, 0, 0)):
    return bytes([0xAA, cmd, *p, 0xBB])

def query(s, cmd, n):
    s.reset_input_buffer()
    s.write(frame(cmd)); s.flush()
    return s.read(n)

def camera_name(s):
    return query(s, READ, 15).decode(errors="replace").rstrip()

def calibration(s, cmd):
    b = query(s, cmd, 2)
    if len(b) < 2: return None
    v = (int.from_bytes(b, "big") - 10000) / 100.0
    return v if abs(v) <= 99 else 0.0

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("port")
    ap.add_argument("--set-camera", metavar="NAME",
                    help="rewrite the stored camera name, e.g. SindenCamC")
    a = ap.parse_args()

    s = serial.Serial(a.port, 115200, timeout=1.5)
    time.sleep(2.0)                      # Leonardo bootloader / port settle
    s.reset_input_buffer()

    fw = query(s, FW, 2)
    print(f"firmware      : v{fw[0]}.{fw[1]}" if len(fw) == 2 else "firmware      : ?")
    print(f"camera name   : {camera_name(s)!r}")
    print(f"calibration X : {calibration(s, CAL_X)}")
    print(f"calibration Y : {calibration(s, CAL_Y)}")

    if a.set_camera:
        old = camera_name(s)
        new = a.set_camera
        if len(new) > 15:
            sys.exit("camera name must be 15 characters or fewer")
        print(f"\nrewriting {old!r} -> {new!r}")
        # index-addressed, one character per frame: AA 67 00 <idx> 00 <ascii> BB
        padded = new.ljust(15)
        for i, ch in enumerate(padded):
            if i < len(old.ljust(15)) and old.ljust(15)[i] == ch:
                continue                 # unchanged, skip
            s.write(frame(WRITE, (0, i, 0, ord(ch)))); s.flush()
            time.sleep(0.05)
        time.sleep(0.5)
        got = camera_name(s)
        print(f"read back     : {got!r}")
        print("OK" if got == new else "FAILED - name did not take")
    s.close()

if __name__ == "__main__":
    main()
