class Dog < Pet

    RANDOM_PHRASES = [
      ['What the noice? Someone wants to kill us. Whoof whoof, you shall not pass', 'the dog barks loudly'],
      ['i wanna you`r hugs, dude', 'your dog has come to you and wants you hug and pet it'],
      ['ohhh what a nice new shoes', 'the dog is biting your shoes'] 
    ].freeze
  
    def play
      @response <<  'you`re throwing the ball and your dog is bringing it'
      @response <<  'whoof whoof it is very funny'
      super
    end
  
    def voice
      @response << 'wooof, wooof, woof'
      @emoji = '&#128515;'
      lower_states
      check
      save
    end
  
    def love
      @response << 'your dog waving his tail and need you pet it'
      @response <<  'whoof whoof, i love you'
      @emoji = '&#128536;'
      lower_states
      check
      save
    end
  
    def toilet
      @response << 'you`re going outdors together' if @need_toilet
      super
    end
  
    def random
      @response << RANDOM_PHRASES.sample
      @emoji = '&#128520;'
      lower_states
      check
      save
    end

  end
  