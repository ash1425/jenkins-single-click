# jenkins-single-click

This is docker based jenkins using JCasC.

You can run it using `run-jenkins.sh`

add your plugins to `plugins.txt`

add your JCasC yaml

## If you want to run docker commands inside your jenkins, expose docker sock as tcp

osx: 

```socat TCP-LISTEN:2375,reuseaddr,fork UNIX-CONNECT:/var/run/docker.sock```
