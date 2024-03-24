$CURRENTDATE = Get-Date -Hour 0 -Minute 0 -Second 0
$FIRSTDAYOFMONTH = Get-Date $CURRENTDATE -Day 1
$LASTDAYOFMONTH = Get-Date $FIRSTDAYOFMONTH.AddMonths(1).AddSeconds(-1)
$curday = Get-Date $CURRENTDATE -Format "dd"
$maxday = Get-Date $LASTDAYOFMONTH -Format "dd"
$month = Get-Date $CURRENTDATE -Format "MM"
$year = Get-Date $CURRENTDATE -Format "yy"
$fullyear = Get-Date $CURRENTDATE -Format "yyyy"
$delta = [math]::floor($curday / $maxday * 100)
$version = "$year$month.$delta"

Write-Host "____________________________"
Write-Host "|                          |"
Write-Host "| Current Version: $version |"
Write-Host "|__________________________|"

$INFFileVersion = "DriverVer   = $month/$curday/$fullyear,$year.$month.$delta.0"

$REGBSPVersion = 'HKLM, "SYSTEM\Platform\DeviceTargetingInfo", "PhoneReleaseVersion", 0x0,  "' + $version + ' (To be filled by O.E.M.)"'

$UEFIFirmwareVersionString = '  gEfiMdeModulePkgTokenSpaceGuid.PcdFirmwareVersionString|L"' + $version + '"'
$UEFIFirmwareRevision      = "  gEfiMdeModulePkgTokenSpaceGuid.PcdFirmwareRevision|0x01$year$month$delta"
$UEFIVersionNumber         = "  gOemPkgTokenSpaceGuid.PcdUefiVersionNumber|0x1$year$month$delta # 1.$year.$month.$delta"
$UEFIBuildDate             = "  gOemPkgTokenSpaceGuid.PcdUefiBuildDate|0x$fullyear$month$curday # $fullyear-$month-$curday"

Write-Host
Write-Host Lumia-Drivers: components/ANYSOC/Support/Desktop/SUPPORT.DESKTOP.BASE/Settings/Version/phonereleaseversion.inf
Write-Host Lumia-Drivers: components/ANYSOC/Support/WCOS/SUPPORT.WCOS.BASE/Settings/Version/phonereleaseversion.inf
Write-Host

Write-Host $INFFileVersion
Write-Host
Write-Host $REGBSPVersion

Write-Host
Write-Host Lumia950XLPkg: Platforms/LumiaFamilyPkg/LumiaFamilyPkg.dsc.inc
Write-Host

Write-Host $UEFIFirmwareVersionString
Write-Host $UEFIFirmwareRevision
Write-Host
Write-Host $UEFIVersionNumber
Write-Host $UEFIBuildDate