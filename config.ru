require 'rack/reloader'
require_relative './lib/controller'

use Rack::Reloader #, 0
#use Rack::Static, :urls => ["/public"]
#use Rack::Auth::Basic do |username, password|
#  password == "dumpling"
#end
run Controller.new
#run ->(env) { Pet.call(env) }