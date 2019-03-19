#!/usr/bin/env python

# Documentation
'''
This script parses a file of commits created by cmesg.sh.
Each commit (author + message) is split at the newline; for each line,
the author is checked to see if the author is Mr. DeVaughn-Brown.
If it is, the commit is ignored; if not, the script checks to see if the
message starts with a specific keyword in accordance with the commit format.
If the commit does not start in that format, the user is prompted
and the Travis-CI build from which this script is executed will fail.
'''

import sys
import os
import re
from subprocess import check_output
from collections import defaultdict

# Open hidden commits file
with open('.commits.txt', 'r') as f:
    print("Checking commit messages...")

    # Take every commit in the file and split it at the new line
    content = f.read()
    lines = content.split("\n")

    # Define has_errors and bad_commit_count variables
    has_errors = False
    bad_commit_count = 0

    # For each line, separate the commit into author and message
    for line in lines:
        current_line = line.split("|")
        author = current_line[0]
        message = current_line[1]
        if current_line != "":

            # If the commit's author is not Mr. Devaughn-Brown,
            # then check the commit message
            if author != "J.D. DeVaughn-Brown":

                # If the message does not start with an
                # appropriate commit type/keyword,
                # set the has_errors variable to true
                if (message.startswith("feat: ")
                    or message.startswith("fix: ")
                    or message.startswith("refactor: ")
                    or message.startswith("style: ")
                    or message.startswith("docs: ")
                    or message.startswith("test: ")
                    or message.startswith("chore: ")
                    or message.startswith("Merge ")
                        or message.startswith("Initial ")
                        or message.startswith("Update ")
                        or message.startswith("Associate ")):
                    pass
                else:
                    print("Bad commit: %s" % message)
                    has_errors = True
                    bad_commit_count += 1

    # If errors are present in our commits, then print out the
    # number of bad commits and exit with status 1.
    if has_errors:
        print("*** Some commits don't follow the template. ***")
        print("Number of bad commits: %d" % bad_commit_count)
        sys.exit(1)
