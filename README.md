# Craft Academy 2021 Atm Challenge
The programm is part of educational material from Fullstack Web Developer Craft Academy bootacmp. It simulates the work of ATM machine. User can perform withraw and deposit cash to virtual account using virtual ATM.
## Dependencies
- rspec
- pry
- Date class
## Setup
Program reqires Ruby 2.5.1p57 and any terminal application to run. In terminal write **irb** and press **Enter**. Now you have to load following files: 

- atm_challenge/lib/person.rb  

To do it write **load '*path to file*'**. This will make necessary classes and methods avalible for use within the Terminal.
## Instructions - Withdrawal
First we have to create a person that will withdraw some cash from his/her account. To do it input following into the Terminal:
- Bob = Person.new(name: 'Bob')  
=> #<Person:0x000056010600d068 @name="Bob", @cash=0, @account=nil>  

we see that Bob is short on cash (@cash = 0) and doesn't have an account (@account=nil), thats not good, lets change it. First we will make an account for Bob, input following:
- Bob.create_account  
  =>#<Account:0x0000560105ffb368 @pin_code=2284, @exp_date="04/26", @account_status=:active, @balance=0, @owner=#<Person:0x000056010600d068 @name="Bob", @cash=0, @account=#<Account:0x0000560105ffb368 ...>>>  

We see that PIN code for the account is 2284, it expires 04/2026 and it has 0 balance((( Very sad.. let's change that. Input following:
- Bob.account.balance = 1000  
 => 1000  

That will deposit 1000 of money to Bob's account. Now he can withdraw some cash! But first we need to rush to closest ATM machine, so type:  
- closest_ATM = Atm.new  
 => #<Atm:0x000056183a5e79c0 @funds=1000>  

Super, its time to get some cash! We need to give ATM how much we want to withdraw, correct PIN and Account, type:  
- Bob.withdraw(amount: 100, pin: 2284, account: Bob.account, atm: closest_ATM)  
 => {:status=>true, :message=>"success", :date=>#<Date: 2021-04-02 ((2459307j,0s,0n),+0s,2299161j)>, :amount=>100, :bills=>[20, 20, 20, 20, 20]}  

 We see that operation was successful and now Bob has 5 bills 20$ each. To check if Bob didn't lost money type:
 - Bob.cash  
 => 100

That was a succesful withdraw

## License
The MIT License