package 'httpd' do
    action :install
end

file '/var/www/index.html' do
    action :create
    content '<html><h1>Hello, world!</h1></html>'
end

service 'httpd' do
    action [ :enable, :start ]
end

