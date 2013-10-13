#!/usr/bin/env rake
# coding: utf-8
# PostgreSQL control tasks

require 'pathname'

pg_data_path = ''
pg_server_log = ''

namespace :postgres do

	desc "Check postgresql server."
	task :check do
		sh "which pg_ctl > /dev/null"
		fail "Not set PG_DATA." unless ENV["PG_DATA"]
		pg_data_path = ENV["PG_DATA"]
		pg_server_log = Pathname.new(pg_data_path).join('server.log').to_s
	end

	desc "Start postgresql server."
	task :start => [:check] do
		sh "pg_ctl -w -D #{pg_data_path} -l #{pg_server_log} start"
	end

	desc "Stop postgresql server."
	task :stop => [:check] do
		sh "pg_ctl -D #{pg_data_path} stop -s -m fast"
	end

	desc "Restart postgresql server."
	task :restart => [:check] do
		sh "pg_ctl -D #{pg_data_path} restart -s -m fast"
	end

	desc "Reload postgresql server settings."
	task :reload => [:check] do
		sh "pg_ctl -D #{pg_data_path} reload -s"
	end

	desc "Check postgresql server status."
	task :status => [:check] do
		sh "pg_ctl -D #{pg_data_path} status"
	end
end

