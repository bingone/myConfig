#[root]$ cat A.sh 
#!/bin/bash
x=`./B.exp`
echo $x
#[root]$ cat B.exp 
#!/usr/bin/expect
set ret  "SUCCESS"
system "echo $ret"
#[root]$ ./A.sh 
#SUCCESS
