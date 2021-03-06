# Create an ATM
# I have run out of cash
# I want to get money out of my account from an Atm

def no_way
  puts "no way hozay"
end

class Atm
  # How do you describe it
  def initialize(address, brand, current_cash)
    @address = address
    @brand = brand
    @current_cash = current_cash
  end

  attr_accessor :address, :brand, :current_cash
  # what does it do
  def dispense(amount)
    @current_cash = @current_cash - amount
    puts "#{amount} was dispensed"
  end
end

class Account
  # how do you describe it
  def initialize(balance, pin)
    @balance = balance
    @pin = pin
    @log = []
  end
  # what does it do
  def correct_pin(pin)
    if @pin == pin
      true
    else
      false
    end
  end

  def enough_money(amount)
    if @balance >= amount
      true
    else
      false
    end
  end

  def withdraw(amount)
    @balance = @balance - amount
    puts "you withdraw #{amount}"
  end
end

##############

broadway_atm = Atm.new("broadway shops", "commbank", 5000)
trents_account = Account.new(1000000, 1337)

puts "hey, welcome to #{broadway_atm.address}"
puts "Please enter your pin?"
answer = gets.chomp.to_i
if trents_account.correct_pin(answer) == true
  puts "How much do you want to withdraw?"
  amount = gets.chomp.to_i
  if trents_account.enough_money(amount) == true
    trents_account.withdraw(amount)
    broadway_atm.dispense(amount)
  else
    no_way
  end
else
  no_way
end