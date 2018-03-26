class User
  getter :account
  def initialize(@account : Account)
  end

  def validate!
    if account && account.owner && account.owner.address
      # do sth
      # ...
    end
  end
end

class Account
  getter :owner
  def initialize(@owner : Owner)
  end
end

class Owner
  getter :address
  def initialize(@address : String)
  end
end

user = User.new(Account.new(Owner.new("Jelinka 48")))
user.validate!
