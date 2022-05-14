#include <string.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>
#include "CompilerFile.h"
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
    int FileStartPostion;
    if(isFlag(argv[1])||FlagType(argv[1])>1) {
        compilerMode=FlagType(argv[1])-2;
        if((argc-1)%2==1) {
            perror("Not all Input Files have outputs");
            return 1;
        } else {
            AmountofFiles=argc-2;
            FileStartPostion=2;
        }
    } else {
        compilerMode=3;
        AmountofFiles=argc-1;
        FileStartPostion=1;
    }
    struct CompilerFile InputFiles[AmountofFiles/2];
    struct CompilerFile OutputFiles[AmountofFiles/2];
    int InputIterator;
    int OutputIterator;
    for (int i=FileStartPostion;i<AmountofFiles;i++) {
        ;
    }
    return 0;
}
bool ValidateFileType(char* File) {
    char* Extenstion;
    int* ExtensionStart;
    strrchr(File,'.');
    if (ExtensionStart==NULL) {
        Extenstion=".bin"
    } else {
        strncpy(File,Extenstion,(strlen(File)-ExtensionStart)+1);
    }
    return strcmp(Extenstion,".c")||strcmp(Extenstion,".h")||strcmp(Extenstion,".o")|strcmp(Extenstion,".s")||strcmp(Extenstion,".i")||strcmp(Extenstion,".bin")||strcmp(Extenstion,".gch")
}
int GetFileType(char* File) {
    char* Extenstion;
    int* ExtensionStart;
    strrchr(File,'.');
    if (ExtensionStart==NULL) {
        Extenstion=".bin"
    } else {
        strncpy(File,Extenstion,(strlen(File)-ExtensionStart)+1);
    }
    if (strcmp(Extenstion,".c")) {
        return 0;
    } else if (strcmp(Extenstion,".h")) {
        return 1;
    }else if (strcmp(Extenstion,".i")){
        return 3
    } else if (strcmp(Extenstion,".gch")){
        return 4;
    }else if (strcmp(Extenstion,".s")) {
        return 5;
    } else if (strcmp(Extenstion,".o")) {
        return 6;
    } else if (strcmp(Extenstion,".bin")) {
        return 7;
    }
    return -1;
}