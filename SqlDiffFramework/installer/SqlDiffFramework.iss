; Script generated by the Inno Setup Script Wizard.
; $Id: SqlDiffFramework.iss 1347 2013-02-16 10:06:31Z ms $
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "SqlDiffFramework"
#define VSDir "C:\usr\ms\devel\dotnet"
#define ProjectDir AddBackslash(VSDir) + AddBackslash("Projects") + MyAppName
#define LibraryDir AddBackslash(VSDir) + AddBackslash("Projects") + "CleanCode"
#define BinDir AddBackslash(ProjectDir) + AddBackslash(MyAppName) + "bin\Release"
#define InstallDir SourcePath
#define ChameleonRichTextBoxControlsDir AddBackslash(LibraryDir) + "ChameleonRichTextBoxControls"
#define DatabaseControlsDir AddBackslash(LibraryDir) + "DatabaseControls"
#define MyAppVersion GetFileVersion(AddBackslash(BinDir) + MyAppName + ".exe")
#define HomePage "http://SqlDiffFramework.codeplex.com/"
#define UserGuideBaseName MyAppName + " UserGuide"

; Be sure to update this MD5 hash if the stub file ({#UserGuideBaseName}.pdf) changes!
#define DocStubHash = "'ff80e43948f8da734ef87f7f805fcf03'"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{19FA713B-2304-4E27-AF5D-E0B88981299A}
AppName={#MyAppName}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher=CleanCode
AppPublisherURL={#HomePage}
AppSupportURL={#HomePage}Thread/List.aspx
AppUpdatesURL={#HomePage}releases
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=true
LicenseFile={#InstallDir}\license.txt
InfoAfterFile={#InstallDir}\post-install.txt
OutputDir={#InstallDir}
OutputBaseFilename={#MyAppName}_setup_{#MyAppVersion}
Compression=lzma
SolidCompression=true
SourceDir={#BinDir}
VersionInfoVersion={#MyAppVersion}
VersionInfoCompany=CleanCode
VersionInfoDescription=Installer for {#MyAppName}
OutputManifestFile={#InstallDir}\{#MyAppName} manifest.txt
VersionInfoCopyright=(C) 2009-2013 Michael Sorens
AppCopyright=Copyright � 2009-2013 Michael Sorens
AppVersion={#MyAppVersion}

[Languages]
Name: english; MessagesFile: compiler:Default.isl

[Types]
Name: standard; Description: Install standard version

[Components]
Name: main; Description: Common Files; Types: standard; Flags: fixed
Name: standardExe; Description: SqlDiffFramework standard version executable; Types: standard; Flags: fixed

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked
Name: quicklaunchicon; Description: {cm:CreateQuickLaunchIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked

[Files]
Source: "{#MyAppName}.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: standardExe
Source: "{#MyAppName}.exe.config"; DestDir: "{app}"; Flags: ignoreversion
Source: "CleanCode.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "CleanCode.ChameleonRichTextBoxControls.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "CleanCode.CsvProcessing.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "CleanCode.DatabaseControls.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "CleanCode.DataGridViewControls.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "CleanCode.GeneralComponents.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "CleanCode.SqlEditorControls.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "PotterDifferenceEngine.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "Dpapi.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "HertelDifferenceEngine.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "LumenWorks.Framework.IO.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "MySql.Data.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "OptionsLib.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "PotterDifferenceEngine.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "SearchableControls.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "SyntaxHighlightingTextBox.dll"; DestDir: "{app}"; Flags: ignoreversion
; Source: System.Data.OracleClient.dll; DestDir: {app}; Flags: ignoreversion
Source: "VDialog.dll"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: "{#InstallDir}\license.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#InstallDir}\PADGen\pad_file.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#DatabaseControlsDir}\Support\QueryLibrary.xsd"; DestDir: "{app}\XML Schema"; Flags: ignoreversion
Source: "{#ChameleonRichTextBoxControlsDir}\ResourceFiles\ContextDefinition.xsd"; DestDir: "{app}\XML Schema"; Flags: ignoreversion
Source: "{#InstallDir}\{#UserGuideBaseName} PlaceHolder.pdf"; DestDir: "{app}"; DestName: "{#UserGuideBaseName}.pdf"; Check: DocFileIsStub('{app}\{#UserGuideBaseName}.pdf')

[Icons]
Name: {group}\{#MyAppName}; Filename: {app}\{#MyAppName}.exe
Name: {group}\{cm:ProgramOnTheWeb,{#MyAppName}}; Filename: {#HomePage}
Name: {group}\{cm:UninstallProgram,{#MyAppName}}; Filename: {uninstallexe}
Name: {group}\{#UserGuideBaseName}; Filename: {app}\{#UserGuideBaseName}.pdf
Name: {commondesktop}\{#MyAppName}; Filename: {app}\{#MyAppName}.exe; Tasks: desktopicon
Name: {userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}; Filename: {app}\{#MyAppName}.exe; Tasks: quicklaunchicon

[Run]
Filename: {app}\{#MyAppName}.exe; Description: {cm:LaunchProgram,{#MyAppName}}; Flags: nowait postinstall skipifsilent

[Code]
{ Do not want to copy the stub user guide on top of a previously downloaded
  real user guide, so check whether the doc file is the original stub or not
  via its MD5 hash. Cannot just check file size because no func is available. }
function DocFileIsStub(FileName: String): Boolean;
begin
  {MsgBox('File = ' + ExpandConstant(FileName), mbInformation, MB_OK);}
  Result := (not FileExists(ExpandConstant(FileName))) or (GetMD5OfFile(ExpandConstant(FileName)) = ExpandConstant({#DocStubHash}));
end;
