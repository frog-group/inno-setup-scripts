;Aims to be a script that can be used for most applications.
;Define variables found from outside the script.
#define FileVersion GetFileVersion("Internet Cafe Simulator\Internet Cafe Simulator.exe")
;Define useful variables to be changed on a case-by-case basis for streamlined setup creation.
#define AppName "Internet Cafe Simulator"
#define AppExe1 "Internet Cafe Simulator.exe"
#define AppParams ""
;#define AppExe2 "sm64ex-coop\sm64.us.f3dex2e.exe"
#if FileVersion != ""
  #define AppVersion FileVersion
#else
  #define AppVersion "2022.1.30"
#endif
#define OneComponent "yes"
#define NoSubComponents "yes"
#define AppSize 4181477538/1024
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
AppVerName={#AppName}
DefaultDirName={autopf}\{#AppName}
DefaultGroupName={#AppName}
FlatComponentsList={#NoSubComponents}
OutputBaseFilename={#AppName}-setup
SetupIconFile={#AppName}\{#AppName}.ico
UninstallDisplayIcon={app}\{#AppName}.ico

;[Components]
;Name: "game"; Description: "Game Files"; Types: full compact custom; Flags: fixed
;Name: "sm64pcbuilder"; Description: "SM64PCBuilder"; Types: full
;Name: "rom"; Description: "SM64 Rom"; Types: full

[Files]
Source: "{#AppName}\*"; DestDir: "{app}"; Flags: recursesubdirs 
;Source: "{#AppName}\sm64ex-coop\*"; DestDir: "{app}\sm64ex-coop"; Flags: recursesubdirs; Components: game
;Source: "{#AppName}\sm64+.ico"; DestDir: "{app}"; Components: game
;Source: "{#AppName}\sm64pcBuilder2.exe"; DestDir: "{app}"; Components: sm64pcbuilder
;Source: "{#AppName}\rom.z64"; DestDir: "{app}"; Components: rom

[Icons]
;Shortcuts on files that must be installed.
Name: "{group}\{#AppName}"; Filename: "{app}\{#AppExe1}"; IconFilename: "{app}\{#AppName}.ico"; Parameters: "{#AppParams}";
;Name: "{group}\{#AppName} Multiplayer"; Filename: "{app}\{#AppExe2}"
Name: "{commondesktop}\{#AppName}"; Filename: "{app}\{#AppExe1}"; IconFilename: "{app}\{#AppName}.ico"; Parameters: "{#AppParams}";
;Name: "{commondesktop}\{#AppName} Multiplayer"; Filename: "{app}\{#AppExe2}"

;Shortcuts on files that may not be installed.
;Name: "{group}\SM64PCBuilder2"; Filename: "{app}\sm64pcBuilder2.exe"; Flags: createonlyiffileexists
;Name: "{commondesktop}\SM64PCBuilder2"; Filename: "{app}\sm64pcBuilder2.exe"; Flags: createonlyiffileexists
