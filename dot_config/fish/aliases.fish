# Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end


# Utilities
function g        ; git $argv ; end
function grep     ; command grep --color=auto $argv ; end

alias vi="nvim"
alias vim="nvim"
alias nerdctl="sudo /home/linuxbrew/.linuxbrew/bin/nerdctl -H /run/k3s/containerd/containerd.sock --namespace=k8s.io"
