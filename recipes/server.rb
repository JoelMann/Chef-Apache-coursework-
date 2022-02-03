package 'httpd' do
    action :install
end

template '/var/www/html/index.html' do
    source 'index.html.erb'
    action :create
end


# note: this works, but is not platform agnostic - this implies only 'linux' or machines that run with this setup.
bash 'inline script' do
    user "root"
    code <<-EOH
    mkdir -p /var/www/mysites/
    chown -R apache /var/www/mysites/
    EOH
    not_if '[ -d /var/www/mysites/ ]'
    action :run
end


service 'httpd' do
    action [ :enable, :start ]
end

