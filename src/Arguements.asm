section .data
    cmdlineFilepath: db "/proc/self/cmdline"
section .text
    global getArguments
getArguments:
    mov %rax, 04h
    mov %rdi, cmdlineFilepath
    mov %rsi,cmdlineStat
    int 80h
    mov cmdlineSize, cmdlineStat[.size]
    .bss arguementsBuffer, cmdlineSize
    mov %rax, 02h
    mov %rdi, cmdlineFilepath
    mov %rsi, 0700
    int 80h
    mov [cmdlineFile], %rax
    mov %rax, 00h
    mov %rdi, [cmdlineFile]
    mov %rsi, arguementsBuffer
    mov %rdx, cmdlineSize
    int 80h
    
section .bss
    cmdlineStat: resb 88
    cmdlineSize: resb 8