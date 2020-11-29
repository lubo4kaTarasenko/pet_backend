require_relative 'pet'
require_relative 'dog'
require_relative 'cat'
require "erb"

class PetController
    attr_accessor :pet

    def initialize(pet)
        @pet = pet
    end

    def render_pet
        path = File.expand_path("../../app/views/layout.html.erb", __FILE__)
        ERB.new(File.read(path)).result(binding)
      end
    
    def execute_command(request_path)
        if @pet.is_dead? 
            puts "i`m dying. i loved u. sorry. "
        end   
        @pet.response = [] unless request_path == '/'
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
