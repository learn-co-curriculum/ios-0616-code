#!/bin/bash
set -e
CURR_DIR="$2";
cd "$1";
gunzip -c -S .xcactivitylog `ls -t | grep 'xcactivitylog' | head -n1` > output2.log;
awk '{ gsub("\r", "\n"); print }' output2.log > unixfile.txt;
LOG=`echo "puts /(^Test Suite '[\w-]+?\.xctest' started at .+?Test Suite '[\w-]+?\.xctest' (failed|passed).+?\.$)/m.match(File.read(\"unixfile.txt\"))" | ruby`;
cd "$CURR_DIR"
[[ -s "/Users/$USER/.rvm/scripts/rvm" ]] && source "/Users/$USER/.rvm/scripts/rvm"
if [[ -z "$(which learn-xcpretty)" ]]; then
  gem install learn-xcpretty
fi
echo "$LOG" | learn-xcpretty -t --report learn
