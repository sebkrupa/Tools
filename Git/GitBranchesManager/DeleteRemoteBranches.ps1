Add-Type -AssemblyName PresentationFramework

Write-Host "--- Removing selected branches from repository ---"
[System.Windows.MessageBox]::Show("This script removes selected branches from the repository.
To delete all branches, use CTRL+A and press OK button.
This operation cannot be undone so be sure of what do you want to delete.
In Readme.md you may find additional information.", "Warning - removing branches", "Ok", "Warning")

# Selecting branches for removal
. .\GetFilteredBranches.ps1
$branchesToRemove = $branches | Sort-Object Author | Out-GridView -Title 'Select branches to REMOVE' -PassThru

# Removing branches from repository
foreach($branch in $branchesToRemove)
{
    $nameToDelete = $branch.Name.Replace('origin/','')
    Write-Host "Removing: $($nameToDelete) created by $($branch.Author)"
    git push origin --delete $nameToDelete
}

Write-Host "All selected branches has been deleted."
Read-Host -Prompt "Press Enter to close."