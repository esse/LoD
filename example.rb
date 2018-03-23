class User

  def initialize(email:, address: nil)
    @email = email
    @address = address
  end

  # symulacja has_one
  attr_accessor :address

  def build_address(*params)
    @address = Address.new(*params)
  end

  def as_json(*)
    {
      email: email,
      city: address.city.canonical_name
    }
  end

  private
  attr_reader :email
end

class Address
end

class City
end

class UserRepository
  DATA = [
    User.new(email: 'user0@example.com'),
    User.new(email: 'user1@example.com'),
  ]

  def self.find(id)
    DATA[id]
  end

  def self.first
    find(0)
  end

  def self.all_ids
    (0..DATA.size-1).to_a
  end

end
