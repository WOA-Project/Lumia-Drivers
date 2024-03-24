foreach ($DriverINFFile in (Get-ChildItem -Path "..\components" -Filter *.inf -Recurse))
{
    $FileName = $DriverINFFile.FullName
    $TempFile = "$($DriverINFFile.FullName).Unicode"
    get-content $FileName | out-file $TempFile -Encoding Unicode
    remove-item $FileName
    rename-item $TempFile $FileName
}