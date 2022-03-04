source ~/.config/fish/aliases.fish

starship init fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias kcc="kubie ctx"
alias kns="kubie ns"
alias k="kubectl"

alias tf="terraform"
set -xg TF_CLI_ARGS_plan "-var-file custom.tfvars"   
set -xg TF_CLI_ARGS_destroy "-var-file custom.tfvars"
set -xg TF_CLI_ARGS_apply "-var-file custom.tfvars"  

alias drun='docker run --rm -it -v $PWD:/work -w /work'

