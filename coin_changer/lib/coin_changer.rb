Penny = 1
Nickel = 5
Dime = 10
Quarter = 25

class CoinChanger
  def self.change(amount)
    change = []
    coins = [Quarter, Dime, Nickel, Penny]
    
    coins.each do |coin|
      while amount >= coin
        change << coin
        amount -= coin
      end
    end

    change
  end
end