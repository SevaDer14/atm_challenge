require './lib/atm.rb'
require 'date'

describe Atm do 
  let(:account) { instance_double('Account', pin_code: '1234', exp_date: '03/22', account_status: :active) }

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
    subject.withdraw(50, '1234', account)
    expect(subject.funds).to eq 950
  end

  it 'allow withdraw if the account has enough balance.' do
    # Creating a variable for the 'expected output' after
    # successful withdraw
    expected_output = { status: true, message: 'success', date: Date.today, amount: 45, bills: [20, 20, 5]}
    # Passing in withdraw amount and account
    expect(subject.withdraw(45, '1234', account)).to eq expected_output
  end

  it 'rejects withdraw if account has insufficient funds' do
    expected_output = { status: false, message: 'insufficient funds', date: Date.today }
    # trying to withdraw an amount larger than account balance
    expect(subject.withdraw(105, '1234', account)).to eq expected_output
  end

  it 'reject withdraw if ATM has insufficient funds' do 
    subject.funds = 50
    expected_output = { status: false, message: 'insufficient funds in ATM', date: Date.today }
    expect(subject.withdraw(100, '1234', account)).to eq expected_output
  end

  it 'rejects withdraw if the PIN is wrong' do
    expected_output = { status:false, message: 'wrong PIN', date: Date.today }
    expect(subject.withdraw(50, 9999, account)).to eq expected_output
  end

  it 'reject withdraw if the card is expired' do
    allow(account).to receive(:exp_date).and_return('12/15')
    expected_output = { status: false, message: 'card expired', date: Date.today }
    expect(subject.withdraw(6, '1234', account)).to eq expected_output
  end

  it 'reject withdraw if the account is inactive' do
    allow(account).to receive(:account_status).and_return(:disabled)
    expected_output = { status:false, message: 'account disabled', date: Date.today }
    expect(subject.withdraw(6, '1234', account)).to eq expected_output 
  end

end