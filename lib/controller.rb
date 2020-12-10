require_relative 'pet'
require_relative 'dog'
require_relative 'cat'
require 'rack'
require "erb"
require_relative '../users/session'
require_relative 'init_game'
require_relative 'pet_controller'

class Controller
  attr_reader :pet 

  def call(env)   
    @user = InitGame.new.init_user(env)  if env["PATH_INFO"].include?('auth')    

    unless @user
      response = InitGame.new.render_auth 
      return  [200, {}, [response]]
    end

    if @user.user_pet
      pet_controller = PetController.new(@user.user_pet)
      pet_controller.execute_command(env["PATH_INFO"])
      return [200, {}, [pet_controller.render_pet]]
    else
      if env["PATH_INFO"].include?('init_pet')
        pet = InitGame.new.init_pet(env, @user)   
        pet_controller = PetController.new(@user.user_pet)
        return [200, {}, [pet_controller.render_pet]]   
      else
        return [200, {}, [InitGame.new.render_init_pet]]
      end
    end  
  end  
end
