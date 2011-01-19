require '../lib/hangman.rb'
require '../lib/graphics.rb'

puts %q{
      __  __
     / / / /___ _____  ____ _____ ___  ____ _____
    / /_/ / __ `/ __ \/ __ `/ __ `__ \/ __ `/ __ \
   / __  / /_/ / / / / /_/ / / / / / / /_/ / / / /
  /_/ /_/\__,_/_/ /_/\__, /_/ /_/ /_/\__,_/_/ /_/
                    /____/

}

print "Enter a solution: "
@hangman = Hangman.new(gets.chomp)

# play the game
while @hangman.active? && @hangman.unsolved?
  
  # clear the screen
  system 'clear'
  
  # display the current state of things
  puts eval("Graphics::Guess_#{@hangman.guesses.length}")
  puts %Q{
    ----  #{@hangman.encrypted_solution}  ----"
  }
  
  # ask to guess a letter
  print "Please guess a letter: "
  @hangman.guess(gets.chomp)
end

# let em know how they did
conclusion_message = @hangman.unsolved? ? "You lost!" : "Congrats!"
puts %Q{
  ----  "#{conclusion_message} The answer was #{@hangman.unencrypted_solution}  ----"
  
}
