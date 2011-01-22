require 'coin_changer'

describe CoinChanger do
  it "should change one penny" do
    CoinChanger.change(1).should == [Penny]
  end
  it "should change two pennies" do
    CoinChanger.change(2).should == [Penny, Penny]
  end
  it "should change three pennies" do
    CoinChanger.change(3).should == [Penny, Penny, Penny]
  end
  it "should change a nickel" do
    CoinChanger.change(5).should == [Nickel]
  end
  it "should change six cents" do
    CoinChanger.change(6).should == [Nickel, Penny]
  end
  it "should change a dime" do
    CoinChanger.change(10).should == [Dime]
  end
  it "should change eleven cents" do
    CoinChanger.change(11).should == [Dime, Penny]
  end
  it "should change fifteen cents" do
    CoinChanger.change(15).should == [Dime, Nickel]
  end
  it "should change sixteen cents" do
    CoinChanger.change(16).should == [Dime, Nickel, Penny]
  end
  it "should change a quater" do
    CoinChanger.change(25).should == [Quarter]
  end
  it "should change twenty-six cents" do
    CoinChanger.change(26).should == [Quarter, Penny]
  end
  it "should change thiry cents" do
    CoinChanger.change(30).should == [Quarter, Nickel]
  end
  it "should change fifty cents" do
    CoinChanger.change(50).should == [Quarter, Quarter]
  end
  it "should change seventy-eight cents" do
    CoinChanger.change(78).should == [Quarter, Quarter, Quarter, Penny, Penny, Penny]
  end
  it "should change ninety-nine cents" do
    CoinChanger.change(99).should == [Quarter, Quarter, Quarter, Dime, Dime, Penny, Penny, Penny, Penny]
  end
  it "should change a dollar" do
    CoinChanger.change(100).should == [Quarter, Quarter, Quarter, Quarter]
  end
end
