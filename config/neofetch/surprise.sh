#!/bin/bash
subreddit=${1-showerthoughts}
outputfile="$HOME/.cache/$subreddit"
username="codeasashu"
redditurl="https://www.reddit.com/r/$subreddit/top.json?sort=top&t=week&limit=100&obey_over18=true"
if ! [ -f $outputfile ]; then
  curl -o $outputfile -s --connect-timeout 5 -A "/u/$username" "$redditurl"
fi
#echo $(jq '.data.children[].data' $outputfile | shuf -n1)
if [ $subreddit == "jokes" ]; then
    echo $(jq '.data.children[].data | .title + " ... " + .selftext' $outputfile | shuf -n1)
else 
    echo $(jq '.data.children[].data | .title' $outputfile | shuf -n1)
fi;
