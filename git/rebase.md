# This document describes the procedure for rebasing in summary.

# Rebasing means replaying the commits of the feature branch against another branch, usually main or master.

# Start from branch which needs to be rebased
# Git checkout
# Git pull

# Rebase against remote main in this case
git rebase origin/main

# Conflicts :(
# As commits are replied, except merge conflicts. You will have to solve them manually each time. This might be a time consuming process.
# Steps:
# Fix manually in files simimar to merge conflicts
git add resolvedfile.xyz
git rebase --continue # Continues replaying commits

# Abort if needed:
# git rebase --Abort

# Sync back
# Syncing back requires the force paramater as the history has changed which makes the remote rightfully suspisious
# git push --force
