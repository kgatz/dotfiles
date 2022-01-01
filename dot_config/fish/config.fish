source ~/.config/fish/aliases.fish

starship init fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias kcc="kubie ctx"
alias kns="kubie ns"
alias k="kubectl"

alias tf="terraform"


alias drun='docker run --rm -it -v $PWD:/app -w /app'

