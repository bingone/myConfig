#!/bin/bash
#bash url_encode.sh 中国
raw=$1

echo $raw
entxt=$( echo -n "$raw" | od -An -tx1 | tr ' ' %|tr -s %  )
echo $entxt
