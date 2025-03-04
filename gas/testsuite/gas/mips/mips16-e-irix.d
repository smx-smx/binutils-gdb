#objdump: -rst --special-syms -mips16
#name: MIPS16 reloc
#as: -32 -mips16
#source: mips16-e.s

# The Irix 5 and 6 assemblers set the type of any common symbol and
# any undefined non-function symbol to STT_OBJECT, 'g1' here.
# See `mips_frob_symbol` in tc-mips.c.

# Check MIPS16 reloc processing

.*: +file format elf32-bigmips

SYMBOL TABLE:
0+0000000 l    d  \.text	0+0000000 \.text
0+0000000 l    d  \.data	0+0000000 \.data
0+0000000 l    d  \.bss	0+0000000 \.bss
0+0000000 l    d  foo	0+0000000 foo
0+0000000 l    d  \.reginfo	0+0000000 \.reginfo
0+0000000 l    d  \.MIPS\.abiflags	0+0000000 \.MIPS\.abiflags
0+0000000 l    d  \.(mdebug|pdr)	0+0000000 \.mdebug|\.pdr
0+0000000 l    d  \.gnu\.attributes	0+0000000 \.gnu\.attributes
0+0000002 l       \.text	0+0000000 0xf0 l1
0+0000004 l       \.text	0+0000000 0xf0 \.L11
0+0000000       O \*UND\*	0+0000000 g1


RELOCATION RECORDS FOR \[foo\]:
OFFSET +TYPE +VALUE
0+0000000 R_MIPS_32         l1
0+0000004 R_MIPS_32         l1
0+0000008 R_MIPS_32         \.L1.*1
0+000000c R_MIPS_32         \.L1.*1
0+0000010 R_MIPS_32         g1
0+0000014 R_MIPS_32         g1


Contents of section \.text:
 0000 65006500 65006500 65006500 65006500  .*
Contents of section \.reginfo:
 0000 00010000 00000000 00000000 00000000  .*
 0010 00000000 00000000                    .*
Contents of section \.MIPS\.abiflags:
 .*
 .*
Contents of section foo:
 0000 00000000 00000008 00000000 00000003  .*
 0010 00000000 00000008 00000000 00000000  .*
Contents of section \.gnu\.attributes:
 .*
