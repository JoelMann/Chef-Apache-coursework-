package 'httpd' do
    action :install
end

template '/var/www/html/' do
    source 'index.html.erb'
    action :create
end


service 'httpd' do
    action [ :enable, :start ]
end

