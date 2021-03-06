unsetopt correct_all
#alias -g ...='../..'
fpath=(/usr/local/share/zsh-completions $fpath)

alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

if which rbenv >/dev/null; then
	eval "$(rbenv init - zsh)"
fi

if which pyenv > /dev/null; then
  eval "$(pyenv init - zsh)"
fi

setopt hist_ignore_all_dups

export PATH=$HOME/.nodebrew/current/bin:$PATH
