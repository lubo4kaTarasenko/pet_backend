require_relative 'user.rb'

class Session

  def initialize(login, password)
    @login = login
    @password = password
  end

  def log_in
    user = User.new(@login, @password)
    if user.exists?(user.load_users)
        if user.correct?(user.load_users)
            p "your pet here"
        else 
            p 'incorrect user'
            return nil
        end
    else
        user.save
    end
    user
  end
end
