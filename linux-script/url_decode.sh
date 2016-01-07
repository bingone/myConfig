#!/bin/bash

#xxd 只用来做转换
#bash url_encode.sh 中国
raw=$1
echo "input:"
echo $raw
echo ------
entxt=$( echo -n "$raw" | tr -d % |xxd -r -ps )
#iconv
#entxt=$( echo -n $entxt | iconv -f gbk -t utf8 )
echo $entxt
