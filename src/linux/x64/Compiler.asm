section .data
    argStartIterator: db 2
    noFilesErrorMessage: db "Error: No Files Specified"
    HelpOne: db "-h"
    HelpTwo:"--help"
    HelpText:"Usage: gcc {OutputFiles} {Flag} {InputFiles} \n-h/--help, Display this Info\n-v/--version,Display the version\n-p,Stop after Preprocessing\n-c,Compile to assembly\n-a,Assemble the code"
    VersionText:"GNU New C Compiler 1.0.0"
    VersionOne:"-v"
    VersionTwo:"--version"
    PreprocessFlag:"-p"
    CompileFlag:"-c"
    AssembleFlag:"-a"
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
        pop %r9
        mov %r9, 0
        cmp %esp,HelpOne
        je HelpOtion
        cmp %esp, HelpTwo
        je HelpOtion
        HelpOption:
            mov %rax, 0
            mov %rdi, 1
            mov %rsi, HelpText
            mov %rdx, 179
            int 80h
            mov %rax, 3ch
            mov %rdi, 0
            int 80h
        cmp %esp, VersionOne
        je VersionOption
        cmp %esp, VersionTwo
        je VersionOption
        VersionOption:
            mov %rax, 0
            mov %rdi, 1
            mov %rsi, VersionText
            mov %rdx, 24
            int 80h
            mov %rax, 3ch
            mov %rdi, 0
            int 80h
        jne Compilation
        Compilation:
            cmp %esp, PreprocessFlag
            je PrePreprocess
            cmp %esp,CompileFlag
            je PreCompile
            cmp %esp,CompileFlag
            je PreCompile
            cmp %esp, AssembleFlag
            je PreAssemble
            jne PreNormal
            PrePreprocess:
                mov compilerMode, 0
                pop %r9
                mov %r9, 0
            PreCompile:
                mov compilerMode,1
                pop %r9
                mov %r9, 0
            PreAssemble:
                mov compilerMode, 2
                pop %r9
                mov %r9, 0
            PreNormal:
                mov compilerMode, 3
getArgumentCount:
    pop argc
    sub %rbp, 4
    sub argc, 1;Instructions to find number of arguments
    ret
section .bss
    argc: resq 1
    argIterator: resd 1
    argTester: resd 1
    compilerMode: resb 1
