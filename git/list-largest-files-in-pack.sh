#!/bin/bash

lookup_commit () {
  while IFS= read -r commit
  do
      if git ls-tree -r $commit | grep $objectid > /dev/null; then
          print_output
          break
      fi
  done <<< $(git log --all --reverse --pretty=format:'%H' -- $gitpath)
}

lookup_path () {
  gitpath=$(git rev-list --all --objects | grep "$objectid" | cut -d " " -f 2)
}

print_output () {
  echo "Found large file $objectid at $gitpath with size $size K? which came from commit $commit"
  echo "Please run git filter-branch --index-filter 'git rm -r --cached --ignore-unmatch $gitpath' --prune-empty"
}

packfile="pack/pack-xyzxyz.idx"
readarray -t output_array < <(git verify-pack -v "$packfile" | sort -k 3 -n -r | head -10)
for line in "${output_array[@]}"
do
  objectid=$(echo "$line" | cut -d " " -f 1)
  size=$(echo "$line" | cut -d " " -f 3)
  lookup_path
  echo "Calling lookup commit with gitpath $gitpath"
  lookup_commit
done
