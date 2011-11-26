class Product < Ohm::Model
  include Ohm::Timestamping
  include Ohm::Typecast

  attribute :name
  attribute :price
  index :name

  def validate
    assert_unique :name
  end

  def self.find_by_name(name)
    self.find(:name => "#{name}").first
  end

end
