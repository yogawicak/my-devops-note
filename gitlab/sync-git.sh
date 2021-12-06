#!/bin/bash
mkdir /home/sync
REPO_HOME="/home/sync"

## repo me
REPOS=([githubrepo]="me/api")

## repo at client
REPO_FK="client/api"

##connect this using personal access token
access_token_git_mastah="token1"
echo "access_token_git_me" + $access_token_git_mastah
access_token_git_fk="token2"
echo "access_token_git_client" + $access_token_git_fk
cd $REPO_HOME
for REPO_GITHUB in "${!REPOS[@]}"
do
	REPO_LOCAL=${REPOS[$REPO_GITHUB]}
        echo "### Processing repo $REPO_LOCAL"
        if [ ! -d $REPO_LOCAL ]; then
                git clone --bare --mirror https://oauth2:$access_token_git_mastah@gitlab.mastah.id/$REPO_LOCAL.git $REPO_LOCAL
        fi
        (cd $REPO_LOCAL; git fetch --prune; git push --prune https://oauth2:$access_token_git_fk@gitlab.forumkeadilan.com/$REPO_FK.git +refs/heads/*:refs/heads/* +refs/tags/*:refs/tags/*)
done
