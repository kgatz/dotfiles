function dtags
  curl "https://registry.hub.docker.com/v1/repositories/ubuntu/tags" --silent | jq '.[].name' | fzf
  end
  