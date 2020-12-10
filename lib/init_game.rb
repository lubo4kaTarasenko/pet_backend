class InitGame
  def init_pet(env, user)
    form = env['rack.input'].read
    pet_params = Rack::Utils.parse_nested_query(form)
    if pet_params['type'] == 'dog'
      pet = Dog.new(pet_params['name'], user.login)
    else
      pet_params['type'] == 'cat'
      pet = Cat.new(pet_params['name'], user.login)
    end
    pet
  end

  def init_user(env)
    form = env['rack.input'].read
    user_params = Rack::Utils.parse_nested_query(form)
    @user = Session.new(user_params['login'], user_params['password']).log_in
  end

  def render_auth
    path = File.expand_path('../app/views/auth.html.erb', __dir__)
    ERB.new(File.read(path)).result(binding)
  end

  def render_init_pet
    path = File.expand_path('../app/views/init_pet.html.erb', __dir__)
    ERB.new(File.read(path)).result(binding)
  end
end
