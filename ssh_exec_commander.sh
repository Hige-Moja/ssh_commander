#!/bin/bash
#In advance you need copy the host public key to remote servers.

function f_ssh_commander() {
  grep -v -e '^\s*#' -e '^\s*$' ${SERVERLIST} | awk 1 | while read server ; do
    echo "${server} / ${CMD}"
    ssh -n ${server} ${CMD}
    echo ''
  done
}

function f_set_command_msg() {
echo " Please enter the command that you want to execute.  e.g. ls -la /service | grep pam"
echo " If you want to exit, input 'quit'"
echo ''
}

function f_set_command() {
if [ -z "${CMD}" ]; then
  f_set_command_msg
  while read key ; do
    case ${key} in
      exit|q|qi|quit  ) exit ;;
      *               ) [ ! -z "${key}" ] && CMD=${key} && break ;;
    esac
    f_set_command_msg
  done
fi
}

function f_set_serverlist() {
if [ "${PARAM}" -eq "1" ]; then
  SERVERLIST=./serverlist_for_ssh_commander.txt
else
  echo " Please enter your server listfile."
  echo " If nothing, will use ./serverlist_for_ssh_commander.txt"
  while read filename ; do
    case ${filename} in
    ""  ) SERVERLIST=./serverlist_for_ssh_commander.txt
          break ;;
    *   ) [ -e ${filename} ] && SERVERLIST=${filename} && break
          echo "Ther serverlist not found."
          echo ''
          echo "Enter your serverlist file."
          echo "If nothing, it will use ./serverlist_for_ssh_commander.txt" ;;
    esac
  done
  echo ''
fi
}

## MAIN
PARAM=$#
CMD=$1
SERVERLIST=$2
f_set_command
f_set_serverlist
f_ssh_commander