#!/bin/sh
# vim: ft=sh

BASE_DIR=$(cd $(dirname $0) && pwd)

# submodule update
git submodule init 
git submodule update

# install bash settings.
function install_bash_settings() {
	BASH_BASE=$BASE_DIR/bash
	if [ -f ~/.bash_profile ]; then
		mv ~/.bash_profile ~/.bash_profile.org
	fi
	ln -s $BASH_BASE/bash_profile ~/.bash_profile

	if [ -f ~/.bashrc ]; then
		mv ~/.bashrc ~/.bashrc.org
	fi
	ln -s $BASH_BASE/bashrc  ~/.bashrc
}

# install zsh settings.
function install_zsh_settings() {
	ZSH_BASE=$BASE_DIR/zsh
	if [ -f ~/.zshenv ]; then
		mv ~/.zshenv ~/.zshenv.org
	fi
	ln -s $ZSH_BASE/zshenv ~/.zshenv

	if [ -f ~/.zshrc ]; then
		mv ~/.zshrc ~/.zshrc.org
	fi
	ln -s $ZSH_BASE/zshrc  ~/.zshrc

	if [ -d ~/.oh-my-zsh ]; then
		mv ~/.oh-my-zsh ~/.oh-my-zsh.org
	fi
	ln -s $ZSH_BASE/oh-my-zsh ~/.oh-my-zsh
	ln -s $ZSH_BASE/my.zsh ~/.oh-my-zsh/custom/my.zsh
}

# install vim settings.
function install_vim_settings() {
	VIM_BASE=$BASE_DIR/vim
	if [ -f ~/.vimrc ]; then
		mv ~/.vimrc ~/.vimrc.org
	fi
	ln -s $VIM_BASE/vimrc ~/.vimrc
	if [ -d ~/.vim ]; then
		mv ~/.vim ~/.vim.org
	fi
	ln -s $VIM_BASE/vimfiles ~/.vim
}

# install tmux settings.
function install_tmux_settings() {
	TMUX_BASE=$BASE_DIR/tmux
	if [ -f ~/.tmux.conf ]; then
		mv ~/.tmux.conf ~/.tmux.conf.org
	fi
	if [ "`uname`" = "Darwin" ]; then
		ln -s $TMUX_BASE/.tmux.conf.osx ~/.tmux.conf
	else
		ln -s $TMUX_BASE/.tmux.conf ~/.tmux.conf
	fi
}

# settings.
install_bash_settings
install_zsh_settings
install_vim_settings
install_tmux_settings

exit 0


