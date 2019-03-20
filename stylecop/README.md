# The StyleCop Section
This is where StyleCop is set up and executed. StyleCop is a code style enforcer for C# code to be used for Unity projects in AP CS Principles.

## SETUP:
### MacOS:
  run ```mac_setup``` with ```source``` command:
    ``source mac_setup``

  This installs all dependencies required for StyleCop.

### 
  1. Install [Scoop](https://scoop.sh/)
  2. Install [Build Tools For Visual Studio 2017](https://visualstudio.microsoft.com/downloads/)
      * Under Tools for Visual Studio 2017 => Build Tools for Visual Studio 2017
      * When the installer opens, you only need to install .NET Desktop Build Tools
  3. Run `source windows_setup` in this directory.

## USAGE:
  `StyleCop [File Path of C-Sharp File or Directory]`

  Should export .xml file in StyleCop folder.

  Settings located in StyleCop.Baboon/Settings.StyleCop
