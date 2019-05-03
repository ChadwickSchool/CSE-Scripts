#!/bin/bash

# Documentation
read -r -d '' DOCUMENTATION <<EOF
This script runs in a Travis-CI build. It creates a file of commits (authors and messages separated by |) which is then parsed by a python script called mesg_check.py.
EOF

# Create a hidden commits file for the python script to collect commits
FILE1=.commits.txt

# If hidden commits file still exists, then remove it
if [[ -e $FILE1 ]]; then
	rm $FILE1
fi

# Retrieve all commits and export them to the hidden file
git log --pretty=format:"%an|%s" >$FILE1

# Run the commit message python script
python mesg_check.py
