if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias cdp="cd ~/Documents/projects/"
alias cdd="cd ~/dotfiles/"

# start starship prompt when fish initializes
starship init fish | source
