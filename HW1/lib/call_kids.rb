# Create a Person class that accepts a name in the constructor
# The Person class should have a getter and setter for the name attribute

# Create a Child class that inherits from Person and additionally
# accepts a telephone number as a second argument in the constructor.
# Create a geter and setter for the telephone_number

# Create a Mother class that inherits from Person and additionally
# accepts a kids array as a second argument in the constructor.
# Create a geter and setter for the kids argument

# On the Mother class implement two functions:

# .kid_names
# It should return an array of strings with kid names

# .call_kids
# The function will return an array of size N (N being the number of children) with members of the array being:
# "Calling #{kid.name} on #{kid.telephone_number} ..."

# Tips:

# Use attr_accessors for getters and setters
# For #kid_names and #call_kids checkout the #map method: http://stackoverflow.com/questions/12084507/what-does-the-map-method-do-in-ruby
# Use the super keyword in the Child and Mother constructor (i.e. initialize method)

class Person
  attr_accessor :name
  def initialize(name)
    @name=name
  end
end

class Child < Person
  attr_accessor :telephone_number
  def initialize(name,telephone_number)
    super(name)
    @telephone_number=telephone_number
  end
end


class Mother < Person
  attr_accessor :kids
  def initialize(name,kids)
    super(name)
    @kids=kids
  end
  def kid_names
    kids.map(&:name)
  end
  def call_kids
    kids.map{|kid| "Calling #{kid.name} on #{kid.telephone_number} ..."}
  end

end
