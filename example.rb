require 'json'
require_relative 'null_objects.rb'
require_relative 'serializers.rb'
require_relative 'factories.rb'

class User
  attr_reader :email

  def initialize(email:, address: nil)
    @email = email
    @address = address
  end

  # symulacja has_one
  attr_accessor :address

  def build_address(*params)
    @address = Address.new(*params)
  end
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
    0 => UserFactory.create_user(email: 'user0@example.com', city_name: "Warsaw"),
    1 => UserFactory.create_user(email: 'user1@example.com')
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
