require './lib/atm.rb'
require 'date'

describe Atm do 
  let(:account) { instance_double('Account') }

  before do
    # Before each test we need to add an attribute of 'balance'
    # to the 'account' object and set the value to '100'
    allow(account).to receive(:balance).and_return(100)
    # We also need a´to allow 'account' to receive the new balance
    # using the setter method 'balance='
    allow(account).to receive(:balance=)
  end
    
  it 'has 1000€ on initialize' do 
    expect(subject.funds).to eq 1000
  end

  it 'funds are reduced at withdraw' do
    subject.withdraw(50, account)
    expect(subject.funds).to eq 950
  end

  it 'allow withdraw if the account has enough balance.' do
    # Creating a variable for the 'expected output' after
    # successful withdraw

    expected_output = { status: true, message: 'success', date: Date.today, amount: 45 }

    # Passing in withdraw amount and account
    expect(subject.withdraw(45, account)).to eq expected_output
  end

end