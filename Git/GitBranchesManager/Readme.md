# Scripts for listing and removal old branches on git repository

## How to use
Copy this to your repository location, then open powershell terminal and run

```ps
.\DeleteRemoteBranches.ps1
```

## Filtering branches for removal

Script name: `GetFilteredBranches.ps1`

### Description

This script is used to list and filter branch names on the remote repository. Output of this script is consumed by the deletion script so if you want to delete more branches that aren't listed in the Deletion GridView, you may modify the filtering here.

By default, list is filtered:
- References to not existing remote branches are removed
- Important branches are excluded from selection so they will not be deleted in the next step
    - You can modify this list by editing the `BranchNamesExcludedFromDelete.txt` file
- Only branches created by the given authors will be listed
    - List of authors can be modified by editing the `SelectAuthorNames.txt` file
- Local branches are excluded from listing