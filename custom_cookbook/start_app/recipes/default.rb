#
# Cookbook Name:: start_app
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

rvm_shell "setup application" do
  user 'vagrant'
  cwd node['start_app']['app_dir']
  code <<-EOC
    bundle install
    cp config/database.yml.sample config/database.yml
    bundle exec rake db:create
    bundle exec rake db:migrate
    bundle exec rake db:seed
  EOC
end

rvm_shell "start server" do
  user 'vagrant'
  cwd node['start_app']['app_dir']
  code <<-EOC
    bundle exec rails s -b 0.0.0.0 --daemon
  EOC
end