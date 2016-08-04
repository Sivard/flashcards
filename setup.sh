echo "Configuring Nginx"
    cp /var/www/provision/config/nginx_vhost /etc/nginx/sites-available/nginx_vhost > /dev/null
    
    ln -s /etc/nginx/sites-available/nginx_vhost /etc/nginx/sites-enabled/
    
    rm -rf /etc/nginx/sites-available/default
    
    service nginx restart > /dev/null