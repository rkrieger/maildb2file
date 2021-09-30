#!/bin/sh

generate=/opt/coloclue/maildb2file/generate
set -e

[ -x ${generate} ] || exit 0

${generate} aliases && postmap hash:/etc/postfix/virtual_alias_maps
${generate} domains && postmap hash:/etc/postfix/virtual_mailbox_domains
${generate} mailboxes && postmap hash:/etc/postfix/virtual_mailbox_maps
