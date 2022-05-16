import yaml
import platform
import cytpes
import types
def GetInfo(Arch: c_char_p):
  InfoArray=[[],[],[]]
  with open("/etc/newgcc/"+Arch+"compilerinfo.yaml","r") as info
            InfoDocument=yaml.safe_load(info)
            for i in InfoDocument["Registers"]:
              InfoArray[0].append(c_char_p(i))
            for i in InfoDocument["Commands"]:
              InfoArray[1].append(c_char_p(i))
            for i in InfoDocument["Syntax"]:
              InfoArray[2].append(c_char_p(i))
  return InfoArray
