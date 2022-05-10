section .data
    cmdlineFilepath: db "/proc/self/cmdline"
section .text
    global getArguments
getArguments:
    .bss arguementsBuffer, cmdlineSize
    .long ArgumentIndexesAmount 0
    .long ArgumentIterator 0
    .long ArgumentsBufferMaxIndex cmdlineSize
    mov %rax, 04h
    mov %rdi, cmdlineFilepath
    mov %rsi,cmdlineStat
    int 80h
    mov cmdlineSize, cmdlineStat[.size]
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
    findAllNulls:
        findifCharNull:
            cmp arguementsBuffer[ArgumentIterator], 00h
            JE updateArgumentIndexesAmount
            updateArgumentIndexesAmount:
                inc ArgumentIndexesAmount
        cmp ArgumentIterator,ArgumentsBufferMaxIndex
        JE updateIteratorandRestart
        updateIteratorandRestart:
            add ArgumentIterator, 1
            jmp findAllNulls
    .long argument
section .bss
    cmdlineStat: resb 88
    cmdlineSize: resb 8