Write-Host "---- Listing remote branches that should be removed from repository --------"

# Settings #
$authorsFileName = "SelectAuthorNames.txt"
$excludedBranchesFileName = "BranchNamesExcludedFromDelete.txt"
Set-Location $PSScriptRoot

# Script #
Write-Host "-Removing references to already deleted branches"
git fetch --prune

. .\GetAllBranches.ps1

# Exclude local branches
Write-Host "-Excluding local branches"
$branches = $branches | Where-Object Name -Match 'origin/'

# Excluding branches from the list
Write-Host "-Excluding important branches that shouldn't be deleted (editable in $excludedBranchesFileName)"
$excludedBranches = Get-Content -Path ".\$excludedBranchesFileName"
$excludedBranchesRegex = [string]::Join('|', $excludedBranches)
$branches = $branches | Sort-Object Name | Where-Object Name -NotMatch $excludedBranchesRegex

#Filtering list by provided authors
Write-Host "-Selecting branches for removal created by specific authors (editable in $authorsFileName)"
$authorsRegex = [string]::Join('|', $authorsToIncludeInSearch)
$branches = $branches | Where-Object Author -Match $authorsRegex

Write-Host "List of remote branches"
$branches | Format-Table