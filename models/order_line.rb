class OrderLine < Ohm::Model
  include Ohm::Timestamping
  include Ohm::Typecast

  #after_safe :update_quantity

  reference :product, Product
  attribute :quantity

  def subtotal
    p self.product.price.to_f
    self.product.price.to_f * self.real_quantity
  end

  def real_quantity
    self.quantity + 1
  end


#  def update_quantity
#    self.incr(quantity)
#  end

end
