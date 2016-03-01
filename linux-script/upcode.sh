#!/bin/bash
#echo $#
source ~/.bash_profile
if [ "$#" = '0' ] ; then
    CODE_PATH='/Users/bingone/develop/CompanyCode'
else
    CODE_PATH=$1
fi
echo $CODE_PATH
cd $CODE_PATH
ret=$(ls -l | awk '
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
    git pull --rebase
    cd ..
done
