class UserFactory
  def self.create_user(email:, city_name: nil)
    address = nil
    if city_name
      city = City.new(city_name)
      address = Address.new(city)
    end
    User.new(email: email, address: address)
  end
end
