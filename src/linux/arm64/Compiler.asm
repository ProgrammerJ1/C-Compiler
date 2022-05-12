section .text
  global _start
  _start:
    int 80h
  getArguments:
    ldr r0, [sp]
