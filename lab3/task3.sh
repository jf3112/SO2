#!/usr/bin/bash -eu

# In all files in the 'groovies' directory, replace $HEADER$ with /subject/.
sed -i 's/\$HEADER\$/\/temat\//g' groovies/*

# In all files in the 'groovies' directory, remove lines containing the phrase 'Help docs:'.
sed -i '/Help docs:/d' groovies/*