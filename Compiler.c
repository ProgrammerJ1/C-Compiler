#include <string.h>
#include <stdbool.h>
int main(int argc,char** argv) {
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