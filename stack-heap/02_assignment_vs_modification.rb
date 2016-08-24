def bar(cats, hat)
  cats[0].upcase!
  cats[1] = "buffy"
  hat[1] = "a"
  cats << "duffy"
  cats.delete_at(2)
  cats = ["babbage"]

  hat.upcase!
  old_hat = hat
  hat = "beret"
  old_hat.reverse!

  puts "in bar"
  p cats
  p hat
  nil
end

def foo
  cats = ["fluffy", "scruffy", "huffy"]
  hat = "fedora"

  bar(cats, hat)

  puts "***********"
  puts "back in foo"
  puts cats
  p hat
end

# What output do you expect?
hat = foo()
puts hat


class Thing
  # def to_s
  #   "hi"
  # end
end

a = Thing.new
puts a
