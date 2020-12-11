class Cat < Pet
  RANDOM_PHRASES = [
    ['What the noice? Perhapse mouse. meow. i cauth you', 'your cat is running very fast all over the house'],
    ['let it be sleep. murrrrr', 'your cat is falling sleep'],
    ['ohhh what a nice new home sneakers', 'the cat sucked in your sneakers']
  ].freeze

  def initialize(name, login)
    super
    @lifes = 9
    save
  end

  def play
    @response << 'you`re painting  with a laser on the wall'
    @response << 'meow , meow , i catch you. i`m a big terrible tiger'
    super
  end

  def voice
    @response << 'meow, meow, mrrrr'
    @emoji = '&#128570;'
    lower_states
    check
    save
  end

  def love
    @response << 'your cat jump on your hands and need you pet it'
    @response << 'murrrr murrr, i love you'
    @emoji = '&#128571;'
    lower_states
    check
    save
  end

  def toilet
    @response << 'oh, you need clean the cat`s tray' if @need_toilet
    super
  end

  def random
    @response << RANDOM_PHRASES.sample
    @emoji = '&#128572;'
    lower_states
    check
    save
  end
end
