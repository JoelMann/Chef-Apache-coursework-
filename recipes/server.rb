package 'httpd' do
    action :install
end

file '/var/www/html/index.html' do
    action :create
    content "<html><h1>Hello, world!</h1>
    <p> This computer is the following:
    Hostname: #{node['hostname']}
    IPAddress: #{node['ipaddress']}
    CPU MHz: #{node['cpu']['0']['mhz']}
    Memory: #{node['memory']['total']}
    </p>
    </html>"
end

service 'httpd' do
    action [ :enable, :start ]
end

