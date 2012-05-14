require 'spec_helper'
require 'set'

describe "Golf" do

  describe ".hole1", :hole => 1 do
    it "counts the appearance of a string within another string" do
      Golf.hole1("a", "anaconda").should == 3
    end
    it "counts more than a single char within a string" do
      Golf.hole1("an", "banana").should == 2
    end
    it "ignores case" do
      Golf.hole1("Fred", "Stop it fred").should == 1
    end
  end

  describe ".hole2", :hole => 2 do
    it "implements a basic shift cypher" do
      Golf.hole2("abcd", 1).should == "bcde"
    end
    it "shifts by different offsets" do
      Golf.hole2("abcd", 3).should == "defg"
    end
    it "ignores spaces" do
      Golf.hole2("this is a secret", 2).should == "vjku ku c ugetgv"
    end
    it "wraps around the alphabet" do
      Golf.hole2("zsa zsa gabor", 1).should == "atb atb hbcps"
    end
  end

  describe ".hole3", :hole => 3 do
    it "sums each row and each column and finds the maximum" do
      Golf.hole3('fixtures/grid-1.txt').should == 24
    end
    it "sums each row and each column and finds the maximum" do
      Golf.hole3('fixtures/grid-2.txt').should == 698
    end
    it "sums each row and each column and finds the maximum" do
      Golf.hole3('fixtures/grid-3.txt').should == 650
    end
  end

  describe ".hole4", :hole => 4 do
    it "converts I to 1" do
      Golf.hole4('I').should == 1
    end
    it "converts V to 5" do
      Golf.hole4('V').should == 5
    end
    it "converts X to 10" do
      Golf.hole4('X').should == 10
    end
    it "converts L to 50" do
      Golf.hole4('L').should == 50
    end
    it "converts IV to 4" do
      Golf.hole4('IV').should == 4
    end
    it "converts VIII to 8" do
      Golf.hole4('VIII').should == 8
    end
    it "converts XI to 11" do
      Golf.hole4('XI').should == 11
    end
    it "converts LVII to 57" do
      Golf.hole4('LVII').should == 57
    end
    it "converts XLIX to 49" do
      Golf.hole4('XLIX').should == 49
    end
  end

  describe ".hole5", :hole => 5 do
    it "finds all unique sub-palindromes within a string" do
      Set.new(Golf.hole5('3333')).should == Set.new(["33", "333", "3333"])
    end
    it "finds all unique sub-palindromes within a string" do
      Set.new(Golf.hole5('12131331')).should == Set.new(["33", "121", "131", "313", "1331"])
    end
    it "finds all unique sub-palindromes within a character string" do
      Set.new(Golf.hole5('madam')).should == Set.new(["ada", "madam"])
    end
  end

  describe ".hole6", :hole => 6 do
    it "processes reverse polish notation addition" do
      Golf.hole6('1 3 +').should == 4
    end
    it "processes reverse polish notation subtraction" do
      Golf.hole6('5 3 -').should == 2
    end
    it "processes reverse polish notation multiplication" do
      Golf.hole6('4 3 *').should == 12
    end
    it "processes reverse polish notation division" do
      Golf.hole6('6 2 /').should == 3
    end
    it "processes reverse polish notation with multiple types" do
      Golf.hole6('7 3 2 - +').should == 8
    end
    it "processes reverse polish notation for more complicated strings" do
      Golf.hole6('5 1 2 + 4 * 3 - +').should == 14
    end
  end
  describe ".hole7", :hole => 7 do
    it "scores a game of bowling" do
      Golf.hole7([2, 3, 5, 4, 1, 6, 8, 0, 3 , 6, 2, 4, 5, 1, 4, 1, 7, 1, 5, 2]).should == 70
    end
    it "scores a game of bowling with spares" do
      Golf.hole7([2, 8, 5, 4, 1, 6, 8, 0, 3 , 6, 2, 4, 5, 1, 4, 1, 7, 1, 5, 2]).should == 75
    end
    it "scores a game of bowling with strikes" do
      Golf.hole7([2, 3, 5, 4, 1, 6, 8, 0, 3 , 6, 2, 4, 5, 1, 4, 1, 10, 5, 2]).should == 79
    end
    it "scores a game of bowling with a a mixture of spares/strikes" do
      Golf.hole7([10, 9, 1, 8, 1, 7, 3, 5, 2, 8, 1, 4, 6, 8, 2, 10, 9, 1, 3]).should == 149
    end
    it "scores a perfect game of bowling" do
      Golf.hole7([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]).should == 300
    end
  end

  describe ".hole8", :hole => 8 do
    it "counts to 100 in English" do
      Golf.hole8.should == ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen", "twenty", "twenty one", "twenty two", "twenty three", "twenty four", "twenty five", "twenty six", "twenty seven", "twenty eight", "twenty nine", "thirty", "thirty one", "thirty two", "thirty three", "thirty four", "thirty five", "thirty six", "thirty seven", "thirty eight", "thirty nine", "forty", "forty one", "forty two", "forty three", "forty four", "forty five", "forty six", "forty seven", "forty eight", "forty nine", "fifty", "fifty one", "fifty two", "fifty three", "fifty four", "fifty five", "fifty six", "fifty seven", "fifty eight", "fifty nine", "sixty", "sixty one", "sixty two", "sixty three", "sixty four", "sixty five", "sixty six", "sixty seven", "sixty eight", "sixty nine", "seventy", "seventy one", "seventy two", "seventy three", "seventy four", "seventy five", "seventy six", "seventy seven", "seventy eight", "seventy nine", "eighty", "eighty one", "eighty two", "eighty three", "eighty four", "eighty five", "eighty six", "eighty seven", "eighty eight", "eighty nine", "ninety", "ninety one", "ninety two", "ninety three", "ninety four", "ninety five", "ninety six", "ninety seven", "ninety eight", "ninety nine", "one hundred"]
    end
  end

  describe ".hole9", :hole => 9 do
    it "plays fizzbuzz to 3, where multiples of 3 are 'fizz'" do
      Golf.hole9(3).should eql [1,2,"fizz"]
    end

    it "plays fizzbuzz to 5, with rules above and multiples of 5 are 'buzz'" do
      Golf.hole9(5).should eql [1,2,"fizz",4,"buzz"]
    end

    it "plays fizzbuzz to 15 with rules above and muliples of 3 and 5 are 'fizzbuzz'" do
      Golf.hole9(15).should eql [1,2,"fizz",4,"buzz","fizz",7,8,"fizz","buzz",11,"fizz",13,14,"fizzbuzz"]
    end

    it "plays fizzbuzz to 30" do
      Golf.hole9(30).should eql [1,2,"fizz",4,"buzz","fizz",7,8,"fizz","buzz",11,"fizz",13,14,"fizzbuzz",16,17,"fizz",19,"buzz","fizz",22,23,"fizz","buzz",26,"fizz",28,29,"fizzbuzz"]
    end
  end
end

