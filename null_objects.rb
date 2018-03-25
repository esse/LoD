class NullCity
  def name
    nil
  end

  def canonical_name
    nil
  end
end

class NullAddress
  def city
    NullCity.new
  end
end
