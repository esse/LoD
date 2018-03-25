class AddressSerializer
  attr_reader :address

  def initialize(address)
    @address = address
  end

  def city
    address.city || NullCity.new
  end

  def canonical_name
    city.canonical_name
  end
end

class UserSerializer
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def address
    user.address || NullAddress.new
  end

  def as_json(*)
    {
      email: user.email,
      city: AddressSerializer.new(address).canonical_name
    }
  end

  def to_json
    as_json.to_json
  end
end
