# abc
# acb
# bac
# bca
# cab
# cba
require 'rspec'


# print all possible permutations
def permutations(str, position=0)
  puts str if position == str.length - 1

  # try each character that we haven't used yet in current position
  (position...str.length).step do |num|
    next_str = str.dup
    # make the char at position be the char at num and vice versa
    next_str[position] = str[num]
    next_str[num] = str[position]
    # cute trick
    # next_str[position], next_str[num] = next_str[num], next_str[position]
    permutations(next_str, position + 1)
  end
end
# permutations("abc", 0)

# alternative approach
# def permutations(remaining_chars, so_far="")
#   puts so_far if remaining_chars.length == 0

#   # call permutations with each of the remaining characters tacked on to so_far
#   remaining_chars.each_char do |char|
#     permutations(remaining_chars.delete(char), char + so_far)
#   end
# end

permutations("abc")
require_relative "lib"

describe "permutations" do
  it "should work for 1 char" do
    expect{permutations("a")}.to output("a\n").to_stdout
  end

  it "should give all permutations of b" do
    expect{permutations("ab")}.to output("ab\nba\n").to_stdout
  end

  it "should give all permutations of abc" do
    printed = capture_stdout { permutations("abc") }

    expect(printed).to satisfy do |printed|
      printed.split("\n").sort == ["abc", "acb", "bac", "bca", "cab", "cba"]
    end
  end
end


# permutations("", "abc")
#   permutations("a", "bc")
#     permutations("ab", "c")
#       permutations("abc", "")
#     permutations("ac", "b")
#       permutations("acb", "")
#   permutations("b", "ac")
#     permutations("ba", "c")
#       permutations("bac", "")
#     permutations("bc", "a")
#       permutations("bca", "")
#   permutations("c", "ab")
#     permutations("ca", "b")
#       permutations("cab", "")
#     permutations("cb", "a")
#       permutations("cba", "")


