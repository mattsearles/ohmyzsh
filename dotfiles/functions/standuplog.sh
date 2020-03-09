function yesterworkday() 
{ 
    if [[ "Mon" == "$(date +%a)" ]]
    then 
        echo "last friday"
    else
        echo "yesterday"
    fi
}
git log --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold magenta)<a:%an> %C(blue) <c:%cn> %Creset%n%b"  --no-merges  --all --date=relative --since="$(yesterworkday) 09:15" --committer="$USER" $@ \
| sed -f $ZSH/custom/plugins/git_log.sed
