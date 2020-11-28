require_relative 'pet'
require_relative 'dog'
require_relative 'cat'
require 'rack'
require "erb"

class InitGame
    def init_pet
        puts 'Please, enter you`r pet`s name? '.yellow
        name = gets.chomp
        puts 'Choose cat or dog, please'.yellow
        type = gets.chomp.downcase
        if type == 'dog'
          pet = Dog.new(name, @user.login)
        elsif type == 'cat'
          pet = Cat.new(name, @user.login)
        else
          puts 'Don`t know this pet'
        end
        puts "Hi i'm your #{pet.class}. My name is #{pet.name}. And I love u :*".yellow
        pet
      end
    
      def init_user 
        login = gets.chomp.downcase
        password = gets.chomp.downcase
        @user = Session.new(login, password).log_in  
        init_user unless @user
      end
    
      def has_pet?
        File.exists?("./database/#{@user.login}.yml")
      end
    
      def load_pet
        YAML.load(File.read("./database/#{@user.login}.yml"))
      end
    
      def user_pet
        has_pet? ? load_pet : init_pet
      end
    
end