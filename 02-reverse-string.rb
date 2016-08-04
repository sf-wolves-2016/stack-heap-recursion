# to use pry, do the following:
# gem install pry-byebug
require 'pry'
require 'rspec'

# reverse_string("hello") => "olleh"

# def reverse_string(str)
#   # if the string is less than one character,
#     # return the string
#   return str if str.length <= 1
#   # split in half, call on each half
#   first_half = str[0...str.length/2]
#   second_half = str[str.length/2..-1]
#   # reverse the order of the two sides
#   reverse_string(second_half) + reverse_string(first_half)
# end

def reverse_string(str)
  # if the string is less than one character,
    # return the string
  return str if str.length <= 1
  # split in half, call on each half
  first_letter = str[0]
  rest = str[1..-1]
  # reverse the order of the two sides
  reverse_string(rest) + first_letter
end

puts reverse_string("abcd")
# puts reverse_string("h")

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
