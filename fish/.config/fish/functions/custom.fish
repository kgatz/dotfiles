function dtags () {
    local image="${1}"

    wget -q "https://registry.hub.docker.com/v1/repositories/${image}/tags" -O - \
        | tr -d '[]" ' | tr '}' '\n' | awk -F: '{print $3}'
}

function weather () {
    curl "https://wttr.in/${1}"
}