section .data
  firstArgIterator: dd 2
section .text
  global _start
  _start:
    int 80h
  getArguments:
    mov argc, %r0
    sub 1, argc
    mov finalArgIterator, argc
    add 2, finalArgIterator
    mov agrv, %r1
    cmp finalArgIterator,2
    mov currentArgIterator, firstArgIterator
    ja findArg:
    findArgs:
      mov %r2, argc
      mov %r3, 4096
      umull %r4, %r2, %r3
      
section .bss
  argc: resd 1
  finalArgIterator: resd 1
  currentArgIterator: resq 1
  currentTrueArgIterator: resq 1
  argumentPointers: resq 8
