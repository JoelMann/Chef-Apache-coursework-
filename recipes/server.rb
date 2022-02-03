package 'httpd' do
    action :install
end

template '/var/www/html/index.html' do
    source 'index.html.erb'
    action :create
end


# note: this works, but is not platform agnostic - this implies only 'bash inclusive' or machines that run with this setup.
# bash 'inline script' do
#     user "root"
#     code <<-EOH
#     mkdir -p /var/www/mysites/
#     chown -R apache /var/www/mysites/
#     EOH
#     not_if '[ -d /var/www/mysites/ ]'
#     action :run
# end

# Execute will 'smart find' what the avail options are, will let chef figure out the way.

# execute 'run a script' do
#     user 'root'
#     command <<-EOH
#     mkdir -p /var/www/mysites/ /
#     chown -R apache /var/www/mysites/
#     EOH
#     action :run
# end

# execute 'run script' do
#     user 'root'
#     command './myscript.sh'
#     action :run
# end

#For our purposes, it's better to do this - this will test/fix/bring into management config.
directory '/var/www/mysites' do
    owner 'apache'
    group 'apache'
    recursive true
    mode '0755'
    action :create
end


service 'httpd' do
    action [ :enable, :start ]
end

