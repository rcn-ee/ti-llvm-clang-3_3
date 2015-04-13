# RUN: llvm-mc -triple s390x-linux-gnu -show-encoding %s | FileCheck %s

#CHECK: seb	%f0, 0                  # encoding: [0xed,0x00,0x00,0x00,0x00,0x0b]
#CHECK: seb	%f0, 4095               # encoding: [0xed,0x00,0x0f,0xff,0x00,0x0b]
#CHECK: seb	%f0, 0(%r1)             # encoding: [0xed,0x00,0x10,0x00,0x00,0x0b]
#CHECK: seb	%f0, 0(%r15)            # encoding: [0xed,0x00,0xf0,0x00,0x00,0x0b]
#CHECK: seb	%f0, 4095(%r1,%r15)     # encoding: [0xed,0x01,0xff,0xff,0x00,0x0b]
#CHECK: seb	%f0, 4095(%r15,%r1)     # encoding: [0xed,0x0f,0x1f,0xff,0x00,0x0b]
#CHECK: seb	%f15, 0                 # encoding: [0xed,0xf0,0x00,0x00,0x00,0x0b]

	seb	%f0, 0
	seb	%f0, 4095
	seb	%f0, 0(%r1)
	seb	%f0, 0(%r15)
	seb	%f0, 4095(%r1,%r15)
	seb	%f0, 4095(%r15,%r1)
	seb	%f15, 0
