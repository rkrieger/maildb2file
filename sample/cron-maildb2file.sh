#!/bin/sh

generate=/opt/coloclue/maildb2file/generate
exitcode=0
set -e

[ -x ${generate} ] || exit 0

# Execute 'generate', saving highest exitcode value
${generate} aliases && postmap hash:/etc/postfix/virtual_alias_maps
if [ $? -gt ${exitcode} ]; then exitcode=$?; fi
${generate} domains && postmap hash:/etc/postfix/virtual_mailbox_domains
if [ $? -gt ${exitcode} ]; then exitcode=$?; fi
${generate} mailboxes && postmap hash:/etc/postfix/virtual_mailbox_maps
if [ $? -gt ${exitcode} ]; then exitcode=$?; fi

# Exit codes for 'generate':
#   0   New data, copied in
#   1   No new data, no action
#   2   Error condition
if [ ${exitcode} -le 1 ]; then
    exit 0
else
    exit ${exitcode}
fi
