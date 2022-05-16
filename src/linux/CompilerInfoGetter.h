#include <stdio.h>
#include <string.h>
#include
struct Register {
  char* Name;
  char* Type;
  size_t Bits;
}
Register* getRegisters(char* Arch) {
  FILE* RegistersListFile;
  char RegistersListFilePath[39+strlen(Arch)]="/etc/newgcc/compilerinfo/";
  strcat(RegistersListFilePath,Arch,strlen(Arch));
  strcat(RegistersListFilePath,"/registers.list",strlen("/registers.list"));
  RegistersListFile=fopen(RegistersListFilePath,"r");
  fseek(RegistersListFile,0,SEEK_END);
  long RegistersFileListSize=ftell(RegistersListFile)
  char* RegistersListText=fread(RegistersListFile,0,RegistersFileListSize);
  char[2][] RegisterDataTextList;
  RegistersListTextIndex=0;
  for (int i=0;i<strlen(RegistersListText);i++) {
    d
