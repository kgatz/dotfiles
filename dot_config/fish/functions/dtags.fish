function dtags
  curl "https://registry.hub.docker.com/v1/repositories/$argv/tags" --silent | jq '.[].name' | fzf
  end
  
