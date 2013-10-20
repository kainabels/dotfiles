unsetopt correct_all
#alias -g ...='../..'
fpath=(/usr/local/share/zsh-completions $fpath)

alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

eval "$(SHELL=zsh rbenv init -)"

