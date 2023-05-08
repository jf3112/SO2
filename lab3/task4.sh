#!/usr/bin/bash -e

# Run the script fakaping.sh, redirect the standard output to null, and sort the errors (without removing duplicates).
./fakaping.sh 2>&1 >/dev/null | sort 

# Run the script fakaping.sh, capture all errors containing 'permission denied' (case-insensitive),
# print them to the console, and save them to the file denied.log. Results should be unique.
./fakaping.sh 2>&1 | grep -i "permission denied" | sort -u | tee denied.log

# Run the script fakaping.sh and save all unique lines to the file all.log and print them to the console.
./fakaping.sh 2>&1 | sort -u | tee all.log
