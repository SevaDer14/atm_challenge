require "pry"

class Account
    STANDARD_VALIDITY_YRS = 5
    attr_accessor :pin_code
    attr_accessor :exp_date
    attr_accessor :account_status
    
    
    #ICOMPLETE: add possibility for 0000 PIN generation 
    def initialize
        @pin_code = rand(1000..9999)
        @exp_date = set_expire_date
        @account_status = :active
    end

    def set_expire_date
        Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%y')
    end

    def deactivate
        @account_status = :deactivated
    end
    
end