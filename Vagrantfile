Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/trusty64'

  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', '1024']
  end

  config.vm.synced_folder '', '/home/vagrant/application'
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.ssh.insert_key = false

  config.vm.provision :chef_solo do |chef|
    chef.log_level = :debug
    chef.cookbooks_path = ['cookbooks', 'custom_cookbook']

    chef.add_recipe 'apt'
    chef.add_recipe 'nodejs'
    chef.add_recipe 'build-essential::default'
    chef.add_recipe 'rvm_sl::user_install'
    chef.add_recipe 'rvm'
    chef.add_recipe 'vim'
    chef.add_recipe 'imagemagick'
    chef.add_recipe 'postgresql::server'
    chef.add_recipe 'postgresql::contrib'
    chef.add_recipe 'postgresql::client'
    chef.add_recipe 'pg_user'
    chef.add_recipe 'ruby_install'
    chef.add_recipe 'start_app'

    chef.json = {
      start_app: {app_dir: '/home/vagrant/application'},
      rvm: {
        user_default_ruby: '2.3.1',
        user: {
          name: 'vagrant',
          home: '/home/vagrant'
        }
      },
      postgresql: {
        enable_pgdg_apt: true, 
        password: {'postgres': 'postgres'},
        user: {
          name: 'vagrant',
          password: '',
          createdb: true,
          login: true
        },
        pg_hba: [
          {type: 'local', db: 'all', user: 'postgres', addr: nil, method: 'trust'},
          {type: 'local', db: 'all', user: 'all', addr: nil, method: 'trust'},
          {type: 'host', db: 'all', user: 'all', addr: '127.0.0.1/32', method: 'trust'},
          {type: 'host', db: 'all', user: 'all', addr: '::1/128', method: 'trust'}
        ]
      }
    }
  end
end