 
#!/bin/bash
# -------------------------------------------------------------------------------
# FileName:    zabbix_curl_sendmail.sh
# Revision:    1.0
# Date:        2015/11/14
# Author:      凉白开
# Email:       dengyun@ttlsa.com
# Website:     www.ttlsa.com
# Description: use curl send email
# Notes:       ~
# -------------------------------------------------------------------------------
# Copyright:   2015 (c) 凉白开
# License:     GPL
 

# curl zabbix_curl_sendmail.sh
# https://www.ttlsa.com/linux/curl-skill-use-curl-send-email/
MAIL_FROM='support@ttlsa.com'
MAIL_TO=$1
MAIL_SUBJECT=$2
MAIL_CONTENT=$3
MAIL_CONTENT_FILE="/tmp/`/bin/date +%s`.txt"
MAIL_SMTP='smtp://smtp.ttlsa.com'
MAIL_USER='support@ttlsa.com'
MAIL_PASSWORD='123456'
 
# create mail content file
echo "From:${MAIL_FROM}
To:$1
Subject: $MAIL_SUBJECT
 
$MAIL_CONTENT "> ${MAIL_CONTENT_FILE}
 
# send mail
/usr/local/bin/curl -s --url "${MAIL_SMTP}" --mail-from "${MAIL_FROM}" --mail-rcpt ${MAIL_TO} \
--upload-file ${MAIL_CONTENT_FILE} --user "${MAIL_USER}:${MAIL_PASSWORD}" 
 
# delete mail content file
rm ${MAIL_CONTENT_FILE}