#!/bin/sh
for ref in $(git for-each-ref --format='%(refname:short)' | grep -e 'origin/hotfix' -e 'origin/rc' -e 'origin/master')
do
    git log $ref -n 1 --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold magenta)<a:%an> %C(blue)<c:%cn> %Creset' --abbrev-commit --date=relative
done