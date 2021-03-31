require 'pry'

class Person
attr_accessor :name

def initialize(attrs = {}) 
set_name(attrs[:name])
end

def set_name(obj)
obj == nil ? missing_name : @name = obj
end

private

def missing_name
raise 'A name is required'
end

end