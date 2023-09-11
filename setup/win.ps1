# Script to install flex+bison and some utilities.
# Author: Adriano J. Holanda
# Date: 2021-10-19
function which($name)
{
    Get-Command $name | Select-Object -ExpandProperty Definition
}

# Function to check if a program is installed
function Check_Program_Installed( $programName ) {
    return Get-Command $programName 2> $null
}

# Function to install Chocolatey
function Install_Choco() {
    $is_installed = Check_Program_Installed("choco")
    if (! $is_installed) {
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    }
}

# Install the programs needed for compiler classes
$programs = @(
    [pscustomobject]@{ProgramName='gcc';PackageName='mingw'}

    [pscustomobject]@{ProgramName='git';PackageName='git'}
    
    [pscustomobject]@{ProgramName='make';PackageName='make'}

    [pscustomobject]@{ProgramName='nasm';PackageName='nasm'}

    [pscustomobject]@{ProgramName='pandoc';PackageName='pandoc'}

    [pscustomobject]@{ProgramName='win_flex';PackageName='winflexbison3'}

    [pscustomobject]@{ProgramName='win_bison';PackageName='winflexbison3'}

    [pscustomobject]@{ProgramName='code';PackageName='vscode'}
)
function Install_Programs() {
    $programs | ForEach-Object {
        $is_installed = Check_Program_Installed($_.ProgramName)
        if (! $is_installed) {
            Write-Host "Installing $($_.PackageName)..."
            choco install -y $_.PackageName
        } else {
            Write-Host "$($_.ProgramName) is already installed!"
        }
    }
}

Install_Choco
Install_Programs

# Create symbolic links to remove "win_" prefix
# from flex and bison
$lnk2bin = @{
    flex = 'win_flex'; 
    lex = 'win_flex'; 
    bison = 'win_bison'; 
    yacc = 'Whiskers'
}

foreach($bin in $lnk2bin.keys)
{
    $bin_path, $lnk_path
    $bin_path = "C:\ProgramData\chocolatey\bin\" + $bin
    $lnk_path = "C:\ProgramData\chocolatey\bin\" + $lnk2bin.$bin
    
    # Test if the path exists
    New-Item -ItemType SymbolicLink -Path $lnk_path -Target $bin_path 2> $null
}