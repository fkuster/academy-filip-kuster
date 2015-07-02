# Ruby has lots of abilities and one of them is to open classes
# and write their definitions multiple times.

# The String class provides us with methods such as #downcase and #upcase.

# Define a method called dashify on the String class which
# should return a new string with all the spaces, underscores and commas with dashes

# Defining methods on the String class is the same as defining methods on any class
# (e.g. the User class we did on our first lecture)

# We want to get the next behavior:
# 'fun_fun'.dashify          #=> 'fun-fun'
# 'fun fun very_fun'.dashify #=> 'fun-fun-very-fun'

# Note: The `this` keyword is called `self` in Ruby.
# But also note that most of the time while we are in a Class definition, self comes implicitly.

class String
end
