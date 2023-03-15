class Branch{
    [string]$Name
    [string]$Author
    [string]$CreatedDate
    [string]$LastCommitDate
}

Write-Host "---- Getting all remote branches ------"
#get git branches
#if you want to list only merged branches, please add '--merged' to the command below
$branchesRaw = git for-each-ref --sort=authorname --format "%(refname:short);%(authorname);%(committerdate);%(creatordate)"

$branches = @()

foreach($branch in $branchesRaw)
{
    $name, $author, $lastCommitDate, $createdDate = $branch -split ';', 4
    $branches += [Branch]@{Name= $name; Author= $author; CreatedDate= $createdDate; LastCommitDate= $lastCommitDate}
}

# Uncomment line below if you want to see branches in the Grid View, but REMEMBER TO COMMENT IT AGAIN - otherwise this grid will be visible while running another scripts that consumes the information from this one.
#$branches | Out-GridView