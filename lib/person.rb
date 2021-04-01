require 'pry'
require './lib/account'
require './lib/atm'

class Person
  attr_accessor :name, :cash, :account

  def initialize(attrs = {}) 
    set_name(attrs[:name])
    @cash = 200
    @account = nil
  end

  def create_account
    @account = Account.new(owner: self)
  end
  
  def set_name(obj)
    obj == nil ? missing_name : @name = obj
  end

  def deposit(amount)
    if @account == nil
      raise RuntimeError, 'No account present'
    else    
      @cash -= amount
      atm = Atm.new    
      atm.deposit(amount, @account)
    end
  end

  private

  
  
  def missing_name
    raise 'A name is required'
  end

end