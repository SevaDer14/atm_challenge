require 'pry'

class Person
  attr_accessor :name

  def initialize(attrs) 
    @name = attrs
  end
end