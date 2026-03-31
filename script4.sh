#!/bin/bash

logfile="$1"
keyword="${2:-error}"
count=0

if [ -z "$logfile" ] || [ ! -f "$logfile" ]
then
    echo "file not found: $logfile"
    exit 1
fi

while [ ! -s "$logfile" ]
do
    echo "file is empty, waiting..."
    sleep 2
done

echo "checking $logfile for '$keyword'"
echo ""

while IFS= read -r line
do
    if echo "$line" | grep -iq "$keyword"
    then
        count=$((count+1))
    fi
done < "$logfile"

echo "done"
echo "total '$keyword' found: $count"

if [ "$count" -gt 0 ]
then
    echo ""
    echo "last 5 matches:"
    grep -i "$keyword" "$logfile" | tail -n 5
fi
