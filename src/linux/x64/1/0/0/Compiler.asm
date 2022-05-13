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
    IOFileAmountError:"Error: Too many inputs or too many outputs"
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
            mov AmountofFiles,argc
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
                pop %r9
                mov %r9, 0
                sub %rbp,4
                sub AmountofFiles, 1
            PreCompile:
                mov compilerMode,1
                pop %r9
                mov %r9, 0
                sub %rbp,4
                sub AmountofFiles, 1
            PreAssemble:
                mov compilerMode, 2
                pop %r9
                mov %r9, 0
                sub %rbp,4
                sub AmountofFiles, 1
            PreNormal:
                mov compilerMode, 3
            mov %ax,AmountofFiles
            div 2
            cmp %ah, 1
            mov notAllFileshaveOuputs, ZF
            cmp compilerMode,3
            and notAllFileshaveOuputs, ZF
            not notAllFileshaveOuputs
            cmp notAllFileshaveOuputs,1
            je IOFileAmountError
            jne IOFilesAmountCorrect
            IOFileAmountError:
                mov %rax, 0
                mov %rdi, 1
                mov %rsi, IOFileAmountError
                mov %rdx, 24
                int 80h
                mov %rax, 3ch
                mov %rdi, 0
                int 80h
            IOFilesAmountCorrect:
                call Compile
getArgumentCount:
    pop argc
    sub %rbp, 4
    sub argc, 1;Instructions to find number of arguments
    ret
section .bss
    argc: resq 1
    fileIterator: resq 1
    argTester: resd 1
    compilerMode: resb 1
    FilesArraySize: resq 1
    AmountofFiles: resw 1
    endArgIterator: resd 1
    notAllFileshaveOuputs: resb 1