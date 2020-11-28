require_relative 'pet'
require_relative 'dog'
require_relative 'cat'
require 'rack'
require "erb"

class Controller
  attr_reader :pet 

  def initialize
    @pet = Cat.new('vasya', 'user')
    p self
    p @pet
  end

  def response
    @pet.name
  end

  def call(env)
    p env["PATH_INFO"]
    execute_command(env["PATH_INFO"])
    [200, {}, [render]]
  end

  def render
    path = File.expand_path("../../app/views/layout.html.erb", __FILE__)
    p self
    html = ERB.new(File.read(path)).result(binding)
    p html
    html
  end

  def execute_command(request_path)
    if @pet.is_dead? 
      puts "i`m dying. i loved u. sorry. "
    end   
    @pet.response = []
    command = request_path.delete('/')
    case command
    when 'feed'
      @pet.feed
    when 'water'
      @pet.water
    when 'toilet'
      @pet.toilet
    when 'sleep'
      @pet.go_sleep
    when 'play'
      @pet.play
    when 'status'
      p @pet
    when 'voice'
      @pet.voice
    when 'love'
      @pet.love
    when 'observe'
      @pet.random
    end

  end
end
