section .data
    cmdlineFilepath: db "/proc/self/cmdline"
section .text
    global getArguments
getArguments:
    mov ArgumentIndexesAmount, 0
    mov ArgumentIterator, 0
    mov %rax, 04h
    mov %rdi, cmdlineFilepath
    mov %rsi,cmdlineStat
    int 80h
    mov cmdlineSize, cmdlineStat[.size]
    mov ArgumentsBufferMaxIndex, cmdlineSize
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
    mov %rax, 03h
    mov %rdi, [cmdlineFile]
    int 80h
    dec ArgumentsBufferMaxIndex
    find
section .bss
    ArgumentIndexesAmount: resb 8
    ArgumentIterator: resb 8
    ArgumentsBufferMaxIndex: resb 8
    cmdlineStat: resb 88
    cmdlineSize: resb 8
    ArgumentsArraySize: resb 8
    firstIndex: resb 8
    currentIndex: resb 8
    secondIndex: resb 8
    currentAdderIndex: resb 8
    ArguemntArrayCurrentIndex: resb 8
    currentArgCharIndex: resb 8
