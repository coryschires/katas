class Bowling
  
  attr_accessor :frames
  
  def initialize
    @frames = []
  end
  
  def roll(ball1, ball2 = 0, ball3 = 0)
    
    if spared_last_frame?
      previous_frame[:pins] += ball1
    end
    if striked_last_frame?
      previous_frame[:pins] += (ball1 + ball2)
    end
    if striked_last_two_frames?
      @frames[-2][:pins] += ball1
    end
    
    @frames << {
      ball1: ball1,
      ball2: ball2,
      ball3: ball3,
      strike: ball1 == 10,
      spare: ball1 != 10 && (ball1 + ball2) == 10,
      pins: ball1 + ball2 + ball3
    }
  end
  
  def score
    score = 0
    @frames.each { |frame| score += frame[:pins] }
    score
  end
  
  def previous_frame
    @frames[-1]
  end
  
  def striked_last_two_frames?
    striked_last_frame? && (@frames[-2] && @frames[-2][:strike])
  end
  
  def spared_last_frame?
    previous_frame && previous_frame[:spare]
  end
  
  def striked_last_frame?
    previous_frame && previous_frame[:strike]
  end

end