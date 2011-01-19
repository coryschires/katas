class Hangman
  
  attr_accessor :solution, :guesses
  
  def initialize(solution)
    @solution = initialize_solution(solution)
    @guesses = []
  end
  
  def guess(letter)
    guesses << letter.upcase
    solution.each do |solution_letter|
      solution_letter[:known] = true if solution_letter[:value] == letter.upcase
    end
  end
  
  def unencrypted_solution
    solution.map { |letter| letter[:value] }.join
  end
  
  def encrypted_solution
    solution.map { |letter| letter[:known] ? letter[:value] : '_' }.join
  end
  
  def active?
    guesses.length < 6
  end
  
  def unsolved?
    solution.map { |letter| letter[:known] }.include?(false)
  end
  
  private
  
  def initialize_solution(solution)
    solution.each_char.map do |char|
      { value: char.upcase, known: char =~ /\w/ ? false : true }
    end
  end

end
