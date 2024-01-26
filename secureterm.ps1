<#
.SYNOPSIS
    Generate random strings based on words from files.

.DESCRIPTION
    This script reads words from 'adj.txt' and 'noun.txt' files and generates random strings.

.PARAMETER numResults
    Number of results to generate.

.EXAMPLE
    .\Script.ps1 -numResults 5
    Generates and prints 5 random strings.

#>

# Function to generate a random word from a given file
function Generate-RandomWord {
    param (
        [string]$filePath
    )

    $words = Get-Content $filePath
    return $words | Get-Random
}

# Function to generate a random string
function Generate-RandomString {
    param (
        [string]$adjFilePath,
        [string]$nounFilePath
    )

    $adjective = Generate-RandomWord -filePath $adjFilePath
    $noun = Generate-RandomWord -filePath $nounFilePath
    $numbers = Get-Random -Minimum 0 -Maximum 1000
    return "$($adjective.ToUpper())$($noun.ToUpper())$numbers"
}

# Main script

param (
    [int]$numResults = 1
)

# Set the paths to your adjective and noun text files
$adjFilePath = ".\adj.txt"
$nounFilePath = ".\noun.txt"

# Generate and print the requested number of results
for ($i = 0; $i -lt $numResults; $i++) {
    $result = Generate-RandomString -adjFilePath $adjFilePath -nounFilePath $nounFilePath
    Write-Output $result
}
