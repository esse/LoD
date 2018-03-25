require 'minitest/autorun'
require_relative 'example.rb'

class ExampleTest < Minitest::Test
  def test_as_json_all_fields
    object = User.new(email: 'user0@example.com', address: Address.new(City.new("Warsaw")))
    assert_equal({email: "user0@example.com", city: "Warsaw"}, object.as_json)
  end

  def test_as_json_without_city
    object = User.new(email: 'user0@example.com', address: Address.new())
    assert_equal({email: "user0@example.com", city: nil}, object.as_json)
  end

  def test_as_json_without_address
    object = User.new(email: 'user0@example.com')
    assert_equal({email: "user0@example.com", city: nil}, object.as_json)
  end
end
