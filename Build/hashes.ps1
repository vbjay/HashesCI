Set-Location $PSScriptRoot\..\

$hsh = git rev-parse HEAD
$fl = "$PSScriptRoot\$hsh.txt" 
git checkout hashes
mkdir "$PSScriptRoot"
if (!(Test-Path "$fl")) {
    $lines = Get-ChildItem -Recurse -File -Path "$PSScriptRoot\..\HashedCI\bin\Release"  | 
    Get-FileHash -Algorithm SHA512 | ForEach-Object { 
        $pth = Resolve-Path -Relative $_.Path
        $unixPath = $pth -replace '\\', '/'
        $hash = $_.Hash.ToUpper()
        "$unixPath`t$hash" }
    
    $lines -join "`r`n" > "$fl"

   
    git add "$fl"
    $msg = "$hsh hashes"
    
    git commit -m "$msg"
    git branch -v
        
}
else {
    "file exists"
    git checkout $hsh
}



