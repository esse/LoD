require 'json'
require 'dry-monads'

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
      city: Dry::Monads::Maybe(address).fmap(&:city).fmap(&:canonical_name).value_or(nil)
    }
  end

  def to_json
    as_json.to_json
  end

  private
  attr_reader :email
end

class Address

  attr_reader :city

  def initialize(city=nil)
    @city = city
  end
end

class City
  def initialize(name)
    @name = name
  end

  def canonical_name
    @name
  end
end

class UserRepository
  DATA = {
    0 => User.new(email: 'user0@example.com', address: Address.new(City.new("Warsaw"))),
    1 => User.new(email: 'user1@example.com')
  }

  def self.find(id)
    DATA[id]
  end

  def self.first
    find(0)
  end

  def self.all_ids
    DATA.keys
  end

end
