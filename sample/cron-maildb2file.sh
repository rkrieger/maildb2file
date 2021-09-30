#!/bin/sh

generate=/opt/coloclue/maildb2file/generate
set -e

[ -x ${generate} ] || exit 0

${generate} aliases && postfix reload
${generate} domains && postfix reload
${generate} mailboxes && postfix reload
