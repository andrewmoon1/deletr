


#!/bin/bash
token="<YOUR_GITHUB_TOKEN>"
curl -H "Authorization: token ${token}" https://api.github.com/user/repos?affiliation=owner | grep git_url | sed -r 's/(    "git_url": "git:\/\/github.com\/)//' | sed -r 's/.git",//'  > url_list.txt
while read r; do 
  curl -XDELETE -H "Authorization: Bearer ${token}" "https://api.github.com/repos/${r}"
  echo "Authorization: Bearer $token" "https://api.github.com/repos/${r}"
  done < url_list.txt
rm url_list.txt