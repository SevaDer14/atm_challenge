class Atm 
  attr_accessor :funds

  def initialize
    @funds = 1000
  end  

  def withdraw(amount, account)

    case
    when insufficient_funds_in_account?(amount, account)
      { status: false, message: 'insufficient funds', date: Date.today }       
    else
      perform_transaction(amount, account)
    end
  end

  private

  def insufficient_funds_in_account?(amount, account)
    amount > account.balance
  end

  def perform_transaction(amount, account)
    # deduct the amount from ATM funds
    @funds -= amount
    # deduct the amount from user balance
    account.balance = account.balance - amount
    # output message of successful withdraw
    { status: true, message: 'success', date: Date.today, amount: amount }     
  end
    
end