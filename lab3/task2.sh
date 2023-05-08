#!/usr/bin/bash -e

# Print all those whose id is an odd number. 
# Save the results to the standard error output.
cut -d ',' -f1-3 yolo.csv | grep "^[1-9]*[0-9]*[13579]," 2> /dev/stderr

# From the file yolo.csv, print each IP number that has one digit in the first and second octet. 
# Save the results to the standard error output.
cut -d ',' -f6 yolo.csv | grep "^[1-9]\.[0-9]\." 2> /dev/stderr
