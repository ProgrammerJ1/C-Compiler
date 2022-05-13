section .data
    argStartIterator: db 2
    noFilesErrorMessage: db "Error: No Files Specified"
    HelpOne: db "-h"
    HelpTwo:"--help"
    HelpText:"Usage: gcc {OutputFiles} {Flag} {InputFiles} \n-h/--help, Display this Info\n-v/--version,Display the version\n-p/--preprocess,Stop after Preprocessing\n-c/--compile,Compile to assembly\n-a,--assemble,Assemble the code"
section .text
    global _start
_start:
    call getArgumentCount
    cmp argc,0
    je NoInputFileError
    jne Program
    NoInputFileError:
        mov %rax, 0
        mov %rdi, 1
        mov %rsi, noFilesErrorMessage
        mov %rdx, 25
        int 80h
        mov %rax, 3ch
        mov %rdi, 22
        int 80h
    Program:
        pop Destroyer
        cmp %esp,HelpOne
        je HelpOtion
        cmp %esp, HelpTwo
        je HelpOtion
        HelpOption:
            mov %rax, 0
            mov %rdi, 1
            mov %rsi, HelpText
            mov %rdx, 213
            int 80h
            mov %rax, 3ch
            mov %rdi, 22
            int 80h
getArgumentCount:
    pop argc
    sub %rbp, 4
    sub argc, 1;Instructions to find number of arguments
    ret
section .bss
    argc: resq 1
    Destroyer: resb 0
