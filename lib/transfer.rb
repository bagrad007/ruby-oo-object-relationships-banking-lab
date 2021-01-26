class Transfer
  attr_accessor :transfer, :amount, :sender, :receiver, :status
  def initialize(sender, receiver, amount)
    self.sender = sender
    self.receiver = receiver
    self.amount = amount
    self.status = "pending"
  end

  def valid?
    if self.sender.valid? && self.receiver.valid? 
      true
    elsif
      false
    end
  end

  def execute_transaction
    #uses amount
    if valid? && sender.balance > self.amount  && self.status == "pending"
      #Takes money from senders account
      self.sender.balance = sender.balance - self.amount
      #Deposits into receivers account
      self.receiver.deposit(self.amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if valid? && self.receiver.balance > self.amount  && self.status == "complete"
      self.receiver.balance = self.receiver.balance - self.amount
      self.sender.deposit(self.amount)
      self.status = "reversed"
    end
  end

end
