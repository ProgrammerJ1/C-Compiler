section .data
    cmdlineFile: "/proc/self/cmdline"
section .text
    global getArguments
getArguments:
    mov 02h, %rax
    mov cmdlineFile, %rdi
    mov 0700, %rsi
    int 80h
