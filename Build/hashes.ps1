Set-Location $PSScriptRoot\..\HashedCI\bin\Release
$lines = Get-ChildItem -Recurse -File  | 
Get-FileHash -Algorithm SHA512 | ForEach-Object { 
    $pth = Resolve-Path -Relative $_.Path
    $unixPath = $pth -replace '\\', '/'
    $hash = $_.Hash.ToUpper()
    "$unixPath`t$hash" }

$lines -join "`r`n" >  hashes.txt 

