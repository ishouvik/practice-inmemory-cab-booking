class Payment
  def self.amount(distance, car_type)
    dragoncoin = (distance * 2)
    (car_type == 'pink') ? (return (dragoncoin + 5)) : (return dragoncoin)
  end
end
