#
# Cookbook Name:: ruby_install
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

rvm_rubies 'ruby-2.1.4' do
  default true
  home '/home/vagrant'
  user_name 'vagrant'
end

rvm_gem 'bundler' do
  home '/home/vagrant'
  ruby_version 'ruby-2.1.4'
  user_name 'vagrant'
end
