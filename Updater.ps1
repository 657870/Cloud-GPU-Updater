$PSScriptRoot
$installedversion = (Get-Content  -Path '.\GPUUpdaterTool.ps1')[0].Split('=')[1]
if ((gwmi win32_operatingsystem | % caption) -like '*Windows 10*') {
    $onlineversion = (Invoke-WebRequest -uri "https://raw.githubusercontent.com/657870/Cloud-GPU-Updater/feature/windows10-support/GPUUpdaterTool.ps1" -UseBasicParsing).Content.Substring(10,3)
} else {
 $onlineversion = (Invoke-WebRequest -uri "https://raw.githubusercontent.com/657870/Cloud-GPU-Updater/feature/windows10-support/GPUUpdaterTool.ps1").Content.Substring(10,3)
}
if ($onlineversion -gt $installedversion){"Update"} Else {"No Update"}