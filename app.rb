require 'sinatra'

set :bind, '0.0.0.0'

get '/hello-world' do
  "Hello from #{ENV['HOSTNAME']}"
end