#!/bin/bash
#echo $#
function red() {
    printf "\033[1;31m%s\n\033[0m" $1
}
function green() {
    printf "\033[1;32m%s\n\033[0m" $1
}
source ~/.bash_profile
if [ "$#" = '0' ] ; then
    CODE_PATH='/Users/bingone/develop/CompanyCode'
else
    CODE_PATH=$1
fi
echo $CODE_PATH
cd $CODE_PATH
ret=$(ls -l | awk '
BEGIN{
    cnt=1
}
{
    if(NR > 1){
        if($1 !~ /^d/){
           next 
        }
        project[cnt] = $9
        #print $0,NR
        #print "cnt " ,cnt, project[cnt]
        cnt=cnt+1
    }
}
END{
    for(i=1;i<length(project);i++){
        printf ("%s ",project[i]);
    }
}
')
#echo "======>>>"
#echo $ret
for x in $ret
do
    echo "cd $CODE_PATH/$x"
    cd $CODE_PATH/$x
    echo $x
    git pull --rebase
    if [ "$?" = "0" ]
    then
        green "${x%*/}_pull_success"
    else
        red "${x%*/}_pull_failed "
    fi
    cd ..
done
