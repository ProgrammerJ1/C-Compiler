section .data
    cmdlineFilepath: db "/proc/self/cmdline"
section .text
    global getArguments
getArguments:
    mov %rax, 04h
    mov 
    int 80h
    mov %rax, 02h
    mov %rdi, cmdlineFilepath
    mov %rsi, 0700
    int 80h
    mov [cmdlineFile], %rax
    mov 
section .bss
    cmdlineStat: resb 88
