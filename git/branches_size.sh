#!/bin/bash

while read branch
do
    size=$(git rev-list --disk-usage --objects HEAD..$branch)
    echo "$size $branch"
done | sort -n
