;Aims to be a script that can be used for most applications.
;Define useful variables to be changed on a case-by-case basis for streamlined setup creation.
#define AppName "Super Mario 64PC+"
#define AppVersion "30.6.2021"
#define OneComponent "no"
#define NoSubComponents "yes"
#define AppSize 161956304/1024
#if AppSize <= 1048576
  #define LZMADictSize AppSize
#else
  #define LZMADictSize 1048576
#endif


[Setup]
;Installer Settings
WizardStyle=modern
AllowNoIcons=yes
ArchitecturesAllowed=x64 x86
ArchitecturesInstallIn64BitMode=x64
DisableStartupPrompt=no
DisableWelcomePage=no
SlicesPerDisk=1
DiskSliceSize=736000000
DiskSpanning=yes
OutputDir=_compiled

;Compression Settings
Compression=lzma2/ultra64
SolidCompression={#OneComponent}
LZMAAlgorithm=1
LZMANumFastBytes=273
LZMAUseSeparateProcess=yes
LZMAMatchFinder=BT
LZMADictionarySize={#LZMADictSize}

;Main Variable Parameters
AppName={#AppName}
AppVersion={#AppVersion}
DefaultDirName={autopf}\{#AppName}
DefaultGroupName={#AppName}
FlatComponentsList={#NoSubComponents}
OutputBaseFilename={#AppName}-setup

[Components]
Name: "game"; Description: "Game Files"; Types: full compact custom; Flags: fixed
Name: "sm64pcbuilder"; Description: "SM64PCBuilder"; Types: full
Name: "rom"; Description: "SM64 Rom"; Types: full

[Files]
Source: "sm64ex-alo\*"; DestDir: "{app}\sm64ex-alo"; Flags: recursesubdirs; Components: game
Source: "sm64ex-coop\*"; DestDir: "{app}\sm64ex-coop"; Flags: recursesubdirs; Components: game
Source: "sm64pcBuilder2.exe"; DestDir: "{app}"; Components: sm64pcbuilder
Source: "rom.z64"; DestDir: "{app}"; Components: rom

[Icons]
;Shortcuts on files that must be installed.
Name: "{group}\{#AppName}\Singleplayer"; Filename: "{app}\sm64ex-alo\sm64.us.f3dex2e.exe"
Name: "{group}\{#AppName}\Multiplayer"; Filename: "{app}\sm64ex-coop\sm64.us.f3dex2e.exe"
Name: "{commondesktop}\{#AppName} Singleplayer"; Filename: "{app}\sm64ex-alo\sm64.us.f3dex2e.exe"
Name: "{commondesktop}\{#AppName} Multiplayer"; Filename: "{app}\sm64ex-coop\sm64.us.f3dex2e.exe"

;Shortcuts on files that may not be installed.
Name: "{group}\SM64PCBuilder2"; Filename: "{app}\sm64pcBuilder2.exe"; Flags: createonlyiffileexists
Name: "{commondesktop}\SM64PCBuilder2"; Filename: "{app}\sm64pcBuilder2.exe"; Flags: createonlyiffileexists
