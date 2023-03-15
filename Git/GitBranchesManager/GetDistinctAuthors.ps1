# This script returns all branch authors in git repository to easier manipulate SelectAuthorNames.txt file.
git for-each-ref --sort=authorname --format "%(authorname)" | Get-Unique | Sort-Object | Out-GridView