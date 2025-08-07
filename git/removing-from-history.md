# Removing files from Git history

## Introduction

This file describes the process of removing files from Git history.
Use cases could be one of the following:

- Secrets or other sensitive information was commited and merged in main and new work has been merged after.
- Large binaries or other assets have been merged in main and new work has been merged after.

## Procedure

### Full path

The problematic files should be known by full path.
To find out the largest file in history, one can look into the Git packfile.
A script has been provided in this stack set that lists the top 10 largest files in the packfile.

### Rewriting history

Please note that the remainder of the procedure will cause the Git history to be rewritten. This is due to the way git works. It is not a filesystem, but rather a series of commits which are played on top of one another.

Rewriting history has significant implications. In general, it is strongly advised not to change it unless really needed such as in the above-described use cases.

In general, the process is easiest if the main branch is the sole branch. Feature branches should be merged beforehand or rebased after. This because the feature branches contain a copy of the history which needs to be modified.

### Git filter branch

The commmand used is the git filter-branch as describd on the documentation at https://git-scm.com/docs/git-filter-branch.

git filter-branch -f --index-filter 'git rm -r --cached --ignore-unmatch dir/path/to/sensitive/or/big/file.zip' --prune-empty

### Garbage collection

Garbage collection needs to be run after the filter branch command. A script is provided in this toolkit to do just that.
