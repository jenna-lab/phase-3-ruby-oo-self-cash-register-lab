class CashRegister
  attr_accessor:total, :discount, :items, :last_transaction
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end
  # accepts a title and a price and increases the total and doesnt forget previous total
  def add_item(title, price, quantity = 1)
    self.total += price * quantity
    quantity.times do
      items << title
    end
    self.last_transaction = price * quantity
  end
  #when the cash register was initialized with an employee discount
  # applies the discount to the total price
  def apply_discount
    if discount != 0
      self.total = (total * ((100.0 - discount.to_f)/100)).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  #void_last_transaction subtracts the last item from the total
  #void_last_transaction returns the total to 0.0 if all items have been removed  
    
  def void_last_transaction
    self.total = self.total - self.last_transaction
  end
end
