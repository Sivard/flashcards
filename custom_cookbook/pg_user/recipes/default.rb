#
# Cookbook Name:: pg_user
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute 'setup_pg_roles' do
  user 'postgres'
  command <<-EOC
  psql -c "CREATE ROLE #{node['postgresql']['user']['name']};" postgres || true
  psql -c "ALTER ROLE #{node['postgresql']['user']['name']} WITH LOGIN;" postgres || true
  psql -c "ALTER ROLE #{node['postgresql']['user']['name']} WITH CREATEDB;" postgres || true
  EOC
end
