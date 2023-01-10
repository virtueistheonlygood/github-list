#!/bin/bash
for file in $(git ls-files | grep -v README.md)
do
	HASHOLD=$(git rev-list HEAD --date-order "$file" | tail -n 1)
	HASHLST=$(git rev-list HEAD --date-order --reverse "$file" | tail -n 1)
	DATEOLD=$(git show -s --format="%f, %ci, %an," $HASHOLD --)
	DATELST=$(git show -s --format="%f, %ci, %an" $HASHLST --)
	printf "%s, %s\n" "$file" "$DATEOLD $DATELST" >> github-list.csv
done
