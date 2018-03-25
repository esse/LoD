require 'minitest/autorun'
require_relative 'example.rb'

class ExampleTest < Minitest::Test
  def test_as_json_all_fields
    object = UserFactory.create_user(email: 'user0@example.com', city_name: "Warsaw")
    assert_equal({email: "user0@example.com", city: "Warsaw"}, UserSerializer.new(object).as_json)
  end

  def test_as_json_without_city
    object =  UserFactory.create_user(email: 'user0@example.com')
    assert_equal({email: "user0@example.com", city: nil}, UserSerializer.new(object).as_json)
  end

  def test_as_json_without_address
    object = UserFactory.create_user(email: 'user0@example.com', city_name: nil)
    assert_equal({email: "user0@example.com", city: nil}, UserSerializer.new(object).as_json)
  end
end
