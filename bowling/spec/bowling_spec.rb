require 'bowling'

describe Bowling do
  before { @bowling = Bowling.new }
  
  describe "#score" do
    it "should mark a double gutter" do
      @bowling.roll(0,0)
      @bowling.score.should == 0
    end
    it "should mark seven pins" do
      @bowling.roll(5,2)
      @bowling.score.should == 7
    end
    it "should mark sixteen pins" do
      @bowling.roll(5,5)
      @bowling.roll(2,2)
      @bowling.score.should == 16
    end
    it "should mark 58 pins" do
      @bowling.roll(10)
      @bowling.roll(10)
      @bowling.roll(7,0)
      @bowling.roll(5,2)
      @bowling.score.should == 58
    end
    it "should score the perfect game" do
      9.times { @bowling.roll(10) }
      @bowling.roll(10,10,10)
      @bowling.score.should == 300
    end
    it "should score the perfect game" do
      9.times { @bowling.roll(10) }
      @bowling.roll(10,10,7)
      @bowling.score.should == 297
    end
    it "should score the perfect game" do
      9.times { @bowling.roll(10) }
      @bowling.roll(10,3,7)
      @bowling.score.should == 283
    end
  end
  
  describe "#spared_last_frame?" do
    it "should mark a spare if the pins total 10" do
      @bowling.roll(5,5)
      @bowling.spared_last_frame?.should be_true
    end
    it "should not mark a spare if the pins are less than 10" do
      @bowling.roll(5,5)
      @bowling.roll(5,2)
      @bowling.spared_last_frame?.should be_false
    end
    it "should not mark spare if a strike is rolled" do
      @bowling.roll(10)
      @bowling.spared_last_frame?.should be_false
    end
  end
  
  describe "#striked_last_frame?" do
    it "should be true if the most recent frame was a strike" do
      @bowling.roll(10)
      @bowling.striked_last_frame?.should be_true
    end
    it "should be false if the most recent frame was a not strike" do
      @bowling.roll(4,2)
      @bowling.striked_last_frame?.should be_false
    end
  end
  
  describe "#has_striked_last_two_frames?" do
    it "should return true if the previous two frames were strikes" do
      @bowling.roll(10)
      @bowling.roll(10)
      @bowling.striked_last_two_frames?.should be_true
    end
    it "should return false if the previous two frames were not strikes" do
      @bowling.roll(5,0)
      @bowling.roll(10)
      @bowling.striked_last_two_frames?.should be_false
    end
  end
  
  describe "when previous frame was a spare" do
    it "should add the pins from the first ball to the spared frame" do
      @bowling.roll(5,5)
      @bowling.roll(4,4)
      @bowling.frames[-2][:pins].should == 14
    end
  end
  
  describe "when the previous frame was a strike" do
    it "should add the pins from the next two rolls to the striked frame" do
      @bowling.roll(10)
      @bowling.roll(4,4)
      @bowling.frames[-2][:pins].should == 18
    end
  end
  
  describe "when the previous two frames were both strikes" do
    it "should add the pins from the first ball to first strike" do
      @bowling.roll(10)
      @bowling.roll(10)
      @bowling.roll(5,5)
      @bowling.frames[-3][:pins].should == 25
    end
  end
  
  describe "#previous_frame" do
    it "should return the data for the last frame" do
      @bowling.roll(4,4)
      @bowling.previous_frame.should == { 
        ball1: 4, ball2: 4, ball3: 0, strike: false, spare: false, pins: 8
      }
    end
  end
  
  describe "#frames" do
    it "should add a new frame after each set off rolls" do
      @bowling.roll(5,2)
      @bowling.frames.size.should == 1
    end
    it "should record the first ball" do
      @bowling.roll(5,2)
      @bowling.previous_frame[:ball1].should == 5
    end
    it "should record the second roll" do
      @bowling.roll(5,2)
      @bowling.previous_frame[:ball2].should == 2
    end
    it "should record the third roll" do
      @bowling.roll(5,5,7)
      @bowling.previous_frame[:ball3].should == 7
    end
    it "should record if the frame was a strike" do
      @bowling.roll(10)
      @bowling.previous_frame[:strike].should be_true
    end
    it "should record if the frame was a spare" do
      @bowling.roll(10)
      @bowling.previous_frame[:spare].should be_false
    end
    it "should record the number of pins for the frame" do
      @bowling.roll(7,2)
      @bowling.previous_frame[:pins].should == 9
    end
  end
    
end