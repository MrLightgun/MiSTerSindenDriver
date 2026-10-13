#!/usr/bin/env python3
"""Does the Sinden camera actually deliver video? Answers in ~6 seconds.

Talks straight to V4L2, bypassing the Sinden driver entirely, so a result here
is independent of any Sinden software configuration. Stop the driver first:
  /media/fat/Scripts/SindenLightgunStop.sh

  python3 camtest.py [/dev/video0] [seconds]

A dead camera still enumerates cleanly, reports VIDEO_CAPTURE and STREAMING,
accepts format negotiation and STREAMON - and then delivers nothing. That is
why "the device is present" proves very little on its own.
"""
import fcntl, mmap, os, select, struct, sys, time

VIDEO   = sys.argv[1] if len(sys.argv) > 1 else "/dev/video0"
SECONDS = float(sys.argv[2]) if len(sys.argv) > 2 else 5.0

def IOC(d, t, nr, size):
    v = (d << 30) | (size << 16) | (t << 8) | nr
    return v - (1 << 32) if v >= (1 << 31) else v

QUERYCAP  = IOC(2, 0x56,  0, 104)
ENUM_FMT  = IOC(3, 0x56,  2,  64)
S_FMT     = IOC(3, 0x56,  5, 204)
REQBUFS   = IOC(3, 0x56,  8,  20)
QUERYBUF  = IOC(3, 0x56,  9,  68)
QBUF      = IOC(3, 0x56, 15,  68)
DQBUF     = IOC(3, 0x56, 17,  68)
STREAMON  = IOC(1, 0x56, 18,   4)
STREAMOFF = IOC(1, 0x56, 19,   4)
CAPTURE, MEMORY_MMAP = 1, 1

fd = os.open(VIDEO, os.O_RDWR)
cap = bytearray(104); fcntl.ioctl(fd, QUERYCAP, cap)
caps = struct.unpack_from("<I", cap, 84)[0]
print(f"{VIDEO}: {cap[16:48].split(bytes(1))[0].decode(errors='replace')}")
print(f"  VIDEO_CAPTURE={bool(caps & 1)}  STREAMING={bool(caps & 0x04000000)}")

fmts = []
for i in range(8):
    d = bytearray(64); struct.pack_into("<II", d, 0, i, CAPTURE)
    try: fcntl.ioctl(fd, ENUM_FMT, d)
    except OSError: break
    fmts.append(struct.unpack_from("<I", d, 12)[0])
chosen = struct.unpack("<I", b"MJPG")[0]
if chosen not in fmts and fmts: chosen = fmts[0]

f = bytearray(204); struct.pack_into("<I", f, 0, CAPTURE)
struct.pack_into("<IIII", f, 4, 320, 240, chosen, 1)
fcntl.ioctl(fd, S_FMT, f)
w, h, pf = struct.unpack_from("<III", f, 4)
print(f"  negotiated {w}x{h} {struct.pack('<I', pf).decode(errors='replace')}")

r = bytearray(20); struct.pack_into("<III", r, 0, 4, CAPTURE, MEMORY_MMAP)
fcntl.ioctl(fd, REQBUFS, r)
maps = []
for i in range(struct.unpack_from("<I", r, 0)[0]):
    b = bytearray(68); struct.pack_into("<III", b, 0, i, CAPTURE, 0)
    struct.pack_into("<I", b, 48, MEMORY_MMAP)
    fcntl.ioctl(fd, QUERYBUF, b)
    off, ln = struct.unpack_from("<I", b, 52)[0], struct.unpack_from("<I", b, 56)[0]
    maps.append(mmap.mmap(fd, ln, mmap.MAP_SHARED, mmap.PROT_READ, offset=off))
    fcntl.ioctl(fd, QBUF, b)

fcntl.ioctl(fd, STREAMON, struct.pack("<I", CAPTURE))
frames = errors = 0
t0 = time.time()
while time.time() - t0 < SECONDS:
    if not select.select([fd], [], [], 2.0)[0]:
        errors += 1; print("    ! no frame within 2s"); continue
    b = bytearray(68); struct.pack_into("<II", b, 0, 0, CAPTURE)
    struct.pack_into("<I", b, 48, MEMORY_MMAP)
    try: fcntl.ioctl(fd, DQBUF, b)
    except OSError as e: errors += 1; print(f"    ! DQBUF: {e}"); continue
    frames += 1
    fcntl.ioctl(fd, QBUF, b)
el = time.time() - t0
fcntl.ioctl(fd, STREAMOFF, struct.pack("<I", CAPTURE))
print(f"\nRESULT : {frames} frames in {el:.1f}s = {frames/el:.1f} fps, {errors} errors")
print("VERDICT: " + ("CAMERA STREAMS OK" if frames > 5 else "CAMERA IS NOT DELIVERING FRAMES"))
for m in maps: m.close()
os.close(fd)
