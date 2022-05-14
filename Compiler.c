#include <string.h>
#include <stdbool.h>
int main(int argc,char** argv) {
    return 0;
}
bool isFlag(char* value) {
    return strcmp(value,"-h")||strcmp(value,"--help")||strcmp(value,"-v")||strcmp(value,"--version")||strcmp(value,"-a")||strcmp(value,"-s")||strcmp(value,"-o");
}