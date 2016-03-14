#!/bin/bash

#xxd 只用来做转换
#bash url_decode.sh "e7 ad be e5 90 8d 20 e3 80 90 e7 8e a9 e5 93 aa e5 84 bf e6 97 85 e8 a1 8c e3 80 91 20 e4 b8 8e e8 ae be e7 bd ae e7 9a 84 e7 ad be e5 90 8d e4 b8 8d e5 8c b9 e9 85 8d 2c"
raw=$1
echo "input:"
echo $raw
echo ------
entxt=$( echo -n "$raw" | tr -d % |xxd -r -ps )
#iconv
#entxt=$( echo -n $entxt | iconv -f gbk -t utf8 )
echo $entxt
