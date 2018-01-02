# require 'resque/tasks'

desc 'show grape routes'
task :routes_with_grape => :environment do
  puts "=========================="
  puts API.routes.count
  API.routes.each do |api|
    method = api.request_method.ljust(10)
    path = api.route_path
    puts "     #{method} #{path}"
  end
end