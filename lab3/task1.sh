#!/usr/bin/bash -e

# Find 10 unique IP addresses in the access_log file.
grep -Eo "^([0-9]{1,3}\.){3}[0-9]{1,3}" access_log | sort -u | head -n 10

# Find requests in the access_log file that contain the phrase "denied" in the link.
grep "/denied" access_log

# Find requests in the access_log file that were sent from the IP address: 64.242.88.10.
grep -w "64\.242\.88\.10" access_log

# Find unique requests of type DELETE in the access_log file.
grep "DELETE" access_log | sort -u 