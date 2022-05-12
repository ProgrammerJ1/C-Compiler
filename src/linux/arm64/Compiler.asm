section .data
  firstArgIterator: dd 2
section .text
  global _start
  _start:
    int 80h
  getArguments:
    mov argc, %r0
    mov
section .bss
  argc: resd 1
  finalArgIterator: resd 1
