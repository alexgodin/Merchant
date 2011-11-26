class Order < Ohm::Model
  include Ohm::Timestamping
  include Ohm::Typecast

  set :orderlines, OrderLine

  def total
    total = 0
    self.orderlines.each do |orderline|
      total += orderline.subtotal
    end
    total
  end
end
