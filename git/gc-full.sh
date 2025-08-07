#!/bin/bash

# Reference: https://stackoverflow.com/questions/11050265/remove-large-pack-file-created-by-git

git for-each-ref --format='delete %(refname)' refs/original | git update-ref --stdin
# Or, for older Git versions (e.g. 1.8.3.1) which don't support --stdin
# git update-ref $(git for-each-ref --format='delete %(refname)' refs/original)
git reflog expire --expire=now --all
git gc --aggressive --prune=now
