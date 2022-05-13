section .data
    argStartIterator: db 2
    noFilesErrorMessage: "Error: No Files Specified"
section .text
    global _start
_start:
    call getArgumentCount
    cmp argc,0
    je NoInputFileError
    NoInputFileError:
        mov %rax, 0
        mov %rdi, 1
        mov %rsi, noFilesErrorMessage
        mov %rdx, 25
getArgumentCount:
    pop argc
    sub %rbp, 4
    sub argc, 1;Instructions to find number of arguments
    ret
section .bss
    argc: resq 1