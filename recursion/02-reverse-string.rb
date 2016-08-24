# to use pry, do the following:
# gem install pry-byebug
# require 'pry'
require 'rspec'


# def reverse_string(str)
#   # what's the base case?
#   return str if str.length <= 1
#   # what's the recursive leap of faith?
#   # need to call ourselves on something smaller each time
#   # take first = h and last = o, middle "ell"
#   first = str[0]
#   last = str[-1]
#   middle = str[1..-2]
#   # call yourself on the middle - lle
#   # put first last, last first, middle in the middle
#   last + reverse_string(middle) + first
# end

def reverse_string(str)
  return str if str.length <= 1
  first = str[0]
  rev = reverse_string(str[1..-1])
  rev + first
end

puts reverse_string("cat")
# puts reverse_string("hello")
# hello
# reverse(ello) + h => olleh
# reverse(llo) + e => olle
# reverse(lo) + l => oll
# reverse(o) + l => ol
# reverse(o) => o

describe "#reverse_string" do
  it "should leave a single-character string as-is" do
    expect(reverse_string("a")).to eq "a"
  end

  it "should swap the characters in a 2 letter string" do
    expect(reverse_string("ay")).to eq "ya"
  end

  it "should be able to handle a longer string (even length)" do
    expect(reverse_string("characters")).to eq "sretcarahc"
  end

  it "should be able to handle a longer string (odd length)" do
    expect(reverse_string("character")).to eq "retcarahc"
  end
end
