#!/usr/bin/env bash
# -----------------------------------------------------------------------------
#      Licensed Materials - Property of IBM
#
#      IBM Cognos Products: ca
#
#      (C) Copyright IBM Corp. 2019
#
#      US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
# -----------------------------------------------------------------------------
set -e
namespace=
deployment=
function usage {
    echo $0: usage: $0 [-h] -d deployment -n namespace
}
function help {
    usage
    echo "-h                prints help to the console"
    echo "-d deployment     deployment (required)"
    echo "-n namespace      namespace or project (required)"
    echo ""
    exit 0
}
while getopts ":hd:n:" opt; do
     case ${opt} in
     h)
        help
        ;;
     d)
        deployment=$OPTARG
        ;;
     n)
        namespace=$OPTARG
        ;;
     \?)
        usage
        exit 0
        ;;
     esac
done
if [ -z $namespace ]; then
    echo "A namespace must be provided"
    help
fi
if [ -z $deployment ]; then
    echo "A deployment must be provided"
    help
fi
cm_pod=$(oc -n $namespace get po | grep -e "^ca.*-cm-0.*" | awk '{ printf $1 }')
dep_home='/home/ibmuser/cognos/analytics/deployment'
oc -n $namespace cp $deployment ${cm_pod}:${dep_home}/$deployment -c cm-0

