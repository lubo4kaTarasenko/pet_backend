require 'rack/reloader'
require_relative './lib/controller'

use Rack::Reloader

run Controller.new
