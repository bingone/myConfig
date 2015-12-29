#!/bin/bash
 
die () {
    echo  "$@"
    exit 1
}
 
[ "$#" -eq 2 ] || die "2 arguments required, $# provided"
 
username=$1;
newpass=$2;
export HISTIGNORE="expect*";
 
expect -c "
        spawn passwd $username
        expect "?assword:"
        send \"$newpass\r\"
        expect "?assword:"
        send \"$newpass\r\"
        expect eof"
 
export HISTIGNORE="";
#exp 2

#!/bin/bash
expect << EOF
spawn  ssh 192.168.2.23
sleep 3
expect "password:"
    send "123456\r"
    expect eof
EOF
