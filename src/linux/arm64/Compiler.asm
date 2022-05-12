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
    ja findArgSizes
    findArgSizes:
      jmp init
      init:
        mov %r2, 4
      loop:
        mov %r3, currentArgIterator
        mul %r4, %r2, %r3
section .bss
  argc: resd 1
  finalArgIterator: resd 1
  currentArgIterator: resq 1
  currentTrueArgIterator: resq 1
  argumentPointers: resq 8
  argumentsArraySize: resq 1
