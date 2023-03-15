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
- Important branches are excluded from selection so they will not be deleted by mistake
    - You can modify this list by editing the `BranchNamesExcludedFromDelete.txt` file
    - Example branch names, that should be here: main, master, any Release branch etc.
- Only branches created by the given authors will be listed, so you won't delete any other branches by mistake
    - List of authors can be modified by editing the `SelectAuthorNames.txt` file
    - If the `SelectAuthorNames.txt` is empty, then the 'cast exception' appear, but the script should work anyway
- Local branches are excluded from listing

## Listing all Branch Authors

You may list all branch authors by running the `GetDiscinctAuthors.ps1` script. This list may be helpful while editing the `SelectAuthorNames.txt` file.

## Listing all Branches

Script name: `GetAllBranches.ps1`
This script is used to get all branches from the remote repository. No filtering is used in this script.

## Deleting

Script name: `DeleteRemoteBranches.ps1`

This script consumes the information from the `GetRemoteBranches.ps1` and removes selected by the user branches from the git repository.
Unselected branches will remain intact.

Grid view enables multiselection so you may pick only the branches that you want to be deleted after clicking OK.
If you want to select all branches, please use CTRL+A and press OK.

<span stype="color:red">Warning: this operation cannot be undone. If you want to stop the script, press CTRL+C on the terminal window!</span>
