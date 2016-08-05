bash "setup application" do
  user 'vagrant'
  cwd node['app_start']['app_dir']
  code <<-EOC
      ruby -v
      cd /vagrant
      rvm current
      ruby -v
      bundle install
      cp config/database.yml.example config/database.yml
      bundle exec rake db:create
      bundle exec rake db:migrate
      bundle exec rake db:seed
  EOC
end