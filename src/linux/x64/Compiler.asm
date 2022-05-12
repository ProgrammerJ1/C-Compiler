section .data
    argStartIterator: db 2
section .text
    global _start
_start:
    call getArguments
getArgumentCount:
    pop argc
    sub %rbp, 4
    sub argc, 1;Instructions to find number of arguments
    ret
section .bss
    argc: resq 1
    argvSize: resq 1