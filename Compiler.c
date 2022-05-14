#include <string.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>
#include "CompilerFile.h"
int main(int argc,char** argv) {
    if (argc==1) {
        perror("Error: No Input Files");
        return 1;
    } else if (isFlag(argv[1])&&(FlagType(argv[1])<2)) {
        switch (FlagType(argv[1])) {
            case 0:
                printf("%s","Usage: <flag> <OutputFile(s)> <InputFiles>\n-h, --help\tDisplay this message and exit the program\n-v, --version\tDisplay the version of this program\n-p\tStop after preprocessing\n-c\nStop after compilation to assembly\n-a Stop after assembly of code");
                break;
            case 1:
                printf("GNU New C Compiler 1.0.0");
                break;
        }
    }
    uint8_t compilerMode;
    int AmountofFiles;
    int AmountofOutputFiles;
    int AmountofInputFiles;
    if(isFlag(argv[1])||FlagType(argv[1])>1) {
        compilerMode=FlagType(argv[1])-2;
        if((argc-1)%2==1) {
            perror("Not all Input Files have outputs");
            return 1;
        } else {
            AmountofFiles=argc-2;
            AmountofOutputFiles,AmountofInputFiles=(argc-1)/2;
        }
    } else {
        compilerMode=3;
        AmountofFiles=argc-1;
        AmountofOutputFiles=1;
        AmountofInputFiles=argc-2;
    }

    return 0;
}
bool isFlag(char* value) {
    return strcmp(value,"-h")||strcmp(value,"--help")||strcmp(value,"-v")||strcmp(value,"--version")||strcmp(value,"-a")||strcmp(value,"-c")||strcmp(value,"-p");
}
int FlagType(char* Flag) {
    if (strcmp(Flag,"-h")||strcmp(Flag,"--help")) {
        return 0;
    } else if (strcmp(Flag,"-v")||strcmp(Flag,"--version")) {
        return 1;
    } else if (strcmp(Flag,"-p")) {
        return 2;
    } else if (strcmp(Flag,"-c")) {
        return 3;
    } else if (strcmp(Flag,"-a")) {
        return 4;
    } else {
        return -1;
    }
}