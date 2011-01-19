require 'hangman'

describe Hangman do
  
  context "when being initialized" do
    before { @hangman = Hangman.new('mongoose') }
    it "should set the solution when the game is started" do
      @hangman.solution.should be
    end
    it "should have no guesses" do
      @hangman.guesses.length.should == 0
    end
  end
  
  context "public methods" do
    describe "#unencrypted_solution" do
      it "should display the solution without any encryption" do
        @hangman = Hangman.new('mongoose')
        @hangman.unencrypted_solution.should == "MONGOOSE"
      end
    end
    describe "#unsolved?" do
      it "should return true unless every letter in the solution is known" do
        @hangman = Hangman.new('abc')
        @hangman.guess('a')
        @hangman.guess('b')
        @hangman.should be_unsolved
      end
    end
    describe "#active?" do
      it "should return true if there have been fewer than six guesses" do
        @hangman = Hangman.new('mongoose')
        @hangman.guess('a')
        @hangman.should be_active
      end
      it "should return return false if there have been six or more guesses" do
        @hangman = Hangman.new('mongoose')
        6.times { @hangman.guess('a') }
        @hangman.should_not be_active
      end
    end
    describe "#guess(letter)" do
      it "should add the guessed letter to the array of guess" do
        @hangman = Hangman.new('mongoose')
        @hangman.guess('f')
        @hangman.guesses.should == ['F']
      end
      it "should check if the guessed letter appears in the solution and mark correct guesses as known" do
        @hangman = Hangman.new('ab')
        @hangman.guess('a')
        @hangman.solution.should == [{ value: 'A', known: true}, { value: 'B', known: false}]
      end
    end
    describe "#encrypted_solution" do
      it "should replace unknown letters with underscores" do
        @hangman = Hangman.new('mongoose')
        @hangman.encrypted_solution.should == '________'
      end
      it "should display known letters normally" do
        @hangman = Hangman.new('mongoose')
        @hangman.guess('o')
        @hangman.encrypted_solution.should == '_O__OO__'
      end
      it "should be mindful of whitespaces" do
        @hangman = Hangman.new('aunt mae')
        @hangman.guess('a')
        @hangman.encrypted_solution.should == 'A___ _A_'
      end
    end
  end
  
  context "private methods" do
    describe "initialize_solution" do
      it "should mark all letters as unknown" do
        @hangman = Hangman.new('a')
        @hangman.solution.should == [{ value: 'A', known: false}]
      end
      it "should mark all whitespaces as known" do
        @hangman = Hangman.new('a b')
        @hangman.solution.should == [{ value: 'A', known: false}, { value: ' ', known: true}, { value: 'B', known: false}]
      end
      it "should mark hyphens as known" do
        @hangman = Hangman.new('a-b')
        @hangman.solution.should == [{ value: 'A', known: false}, { value: '-', known: true}, { value: 'B', known: false}]
      end
    end
  end
  
end