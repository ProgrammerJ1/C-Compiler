section .data
    argStartIterator: db 2
section .text
    global _start
_start:
    call getArguments
getArguments:
    mov argc, (%rsp)
    sub argc, 1;Instructions to find number of arguments
    mov argEndIterator, argc
    add argEndIterator, 2;Functions to get End Argument Iterator
    cmp argEndIterator,2
    jne findargsSize
    findargsSize:
        mov %rax, currentargIterator
        mov %rcx, 8
        imul, %rcx
        mov 
        mov %rdi, [(%rsp)
section .bss
    argc: resq 1
    argvSize: resq 1
    argEndIterator: resq 1
    currentargIterator: resq 1
    currentTrueArgIterator: resq 1