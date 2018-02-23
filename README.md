# ssh_exec_commander

## Overview

Connect to the server described in the text file in order by SSH and execute the command.
In advance you need copy the host public key to remote servers.

## Usage

### 1 ./ssh_exec_commander

Interactive format
```
 Please enter the command that you want to execute.  e.g. ls -la /service | grep pam
 If you want to exit, input 'quit'
```
``` 
 Please enter your server listfile.
 If nothing, will use ./serverlist_for_ssh_commander.txt
```

### 2 ./ssh_exec_commander [command]

Execute the command specified as an argument on the default list server.

e.g.
```
$ echo "server1.localhost" > serverlist_for_ssh_commander.txt
$ echo "server2.localhost" >> serverlist_for_ssh_commander.txt
$ ./ssh_exec_commander "ls -la / | grep usr"
server1.localhost / ls -la / | grep usr
/usr
server2.localhost / ls -la / | grep usr
/usr
$
```

### 3 ./ssh_exec_commander [command] [serverlist]

Specify command and server list

e.g.
```
$ echo "server3.localhost" > srverlist.txt
$ echo "server4.localhost" >> serverlist.txt
$ ./ssh_exec_commander "ls -la /usr/local | grep apache"
server3.localhost / ls -la /usr/local | grep apache
/usr/local/apache2.4
server4.localhost / ls -la /usr/local | grep apache
/usr/local/apache2.2
$
```
