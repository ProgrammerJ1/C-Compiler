#include <stdio.h>
#include <string.h>
struct Register {
  char* Name;
  char* Type;
  size_t Bits;
}
Register* getRegisters(char* Arch) {
  FILE* RegistersListFile;
  char RegistersListText[39+strlen(Arch)]="/etc/newgcc/compilerinfo/";
  strcat(RegistersListText,Arch,strlen(Arch));
  strcat(RegistersListText,"/registers.list",strlen("/registers.list"));
