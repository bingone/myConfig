#!/bin/bash
#bash url_encode.sh 中国
raw=$1
echo "input:"
echo $raw
echo ------
entxt=$( echo -n "$raw" | od -An -tx1 | tr ' ' %|tr -s %|sed 's/^\(.*\).$/\1/'  )
echo $entxt
