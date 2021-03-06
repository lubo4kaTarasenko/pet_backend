require 'yaml'

class Pet
  attr_accessor :name, :response, :states, :lifes, :emoji, :user_login

  def initialize(name, user_login)
    @user_login = user_login
    @avatar = 0
    @name = name
    @feed_level = 3
    @water_level = 3
    @energy_level = 3
    @lifes = 3
    @need_toilet = false
    @states = ["feed_level = #{@feed_level}", "water_level = #{@water_level}", "energy_level = #{@energy_level}"]
    @response = []
    @emoji = '&#128525;'
    save
  end

  def feed
    if @feed_level < 3
      @feed_level = 3
      @response << 'omnomnom. thank u, dude'
      @emoji = '&#128523;'
    else
      @response << 'feeeeeee. not hungry.'
      @emoji = '&#128532;'
    end
    check
    save
  end

  def water
    if @water_level < 3
      @water_level = 3
      @response << 'bul-bul-hlyup-hlyup. thank u, dude'
      @emoji = '&#128523;'
    else
      @response << 'feeeeeee. not thirsty.'
      @emoji = '&#128532;'
    end
    check
    save
  end

  def go_sleep
    if @energy_level < 3
      @energy_level = 3
      @response << 'hhhhrrrrrptcchhhhhh'
      @amoji = '&#128524;'
    else
      @response << 'feeeeeee. don`t wanna sleep'
      @emoji = '&#128532;'
    end
    check
    lower_states
    save
  end

  def toilet
    if @need_toilet
      @response << 'I`ve done it'
      @emoji = '&#128520;'
    else
      @response << 'feeeeeee. don`t need toilet'
      @emoji = '&#128532;'
    end
    @need_toilet = false
    lower_states
    check
    save
  end

  def play
    @response << 'you`r playing with your pet'
    @emoji = '&#128516;'
    lower_states
    check
    save
  end

  def is_dead?
    @lifes == 0
    save
  end

  def save
    name = user_login
    yaml = YAML.dump(self)
    File.open("./database/#{name}.yml", 'w') { |file| file.puts(yaml) }
  end

  private

  def hungry?
    @feed_level == 1
  end

  def thirsty?
    @water_level == 1
  end

  def sleepy?
    @energy_level == 1
  end

  def lower_states
    @feed_level -= 1
    @water_level -= 1
    @energy_level -= 1
  end

  def maybe_lose_life
    if [@feed_level, @water_level, @energy_level].any?(&:zero?)
      @lifes -= 1
      @response << "I have just lost one of my lifes(( now I have #{@lifes} lifes"
      @emoji = '&#128561;'
      @feed_level = 3
      @water_level = 3
      @energy_level = 3
    end
  end

  def update_states
    @states = ["feed_level = #{@feed_level}", "water_level = #{@water_level}", "energy_level = #{@energy_level}"]
  end

  def check
    @response << 'I`m so  hungry!' if hungry?
    @response << 'I`m so thirsty!' if thirsty?
    @response << 'I need toilet!' if @need_toilet
    @response << 'I need to sleep!' if sleepy?
    maybe_lose_life
    update_states
    @response.each { |r| puts Array(r).join }
  end
end
