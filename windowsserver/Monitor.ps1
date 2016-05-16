$DirectoryName = "C:\Users\vagrant\Downloads"

$FileName = Get-ChildItem $DirectoryName | sort LastWriteTime | select -last 1
$FilePath = Join-Path -Path $DirectoryName -ChildPath $FileName
$ChildPath = [System.IO.Path]::GetFileNameWithoutExtension($FilePath)
$FilePathNoExtension = Join-Path -Path $DirectoryName -ChildPath $ChildPath
$NewFolder = New-Item -ItemType directory -Path $FilePathNoExtension
$msbuild = "C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe"

$FSWProps = @{
  Path = $DirectoryName
  IncludeSubdirectories = $False
}

$Watcher = New-Object System.IO.FileSystemWatcher -Property $FSWProps

$UnzipAction = {
  Expand-Archive $FilePath -dest $DirectoryName
}

$DeleteAction = {
  Remove-Item -Path $FilePath -Force
}

$MSBuildAction = {
  & $msbuild $FilePathNoExtension\$ChildPath.sln /p:DeployOnBuild=true
  /p:PublishProfile=Test
}

&$UnzipAction
&$MSBuildAction
&$DeleteAction
