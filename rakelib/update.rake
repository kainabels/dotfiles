#!/usr/bin/env rake
# coding: utf-8
# setup dotfiles

require 'pathname'

namespace :update do
	desc "update submodule."
	task :submodule => ["update:base"] do
		sh "git submodule foreach 'git pull origin master'"
    #sh "git submodule update"
	end

	desc "update dotfiles."
	task :base do
		sh "git pull"
	end

	desc "update all."
	task :all => :submodule do
	end
end

