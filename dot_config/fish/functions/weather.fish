function weather -d "Prints weather information for the given location"
    if set -q $argv[1]
        set location $argv[1]
    else
        set location "Jyväskylä"
    end

    # Parse language information from current locale
    set -l language (string split "_" -- $LANG)[1]

    curl -H "Accept-Language: $language" wttr.in/"$argv[1]?0&n&q"
end