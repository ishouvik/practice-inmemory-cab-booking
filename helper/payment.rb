class Payment
  # Calculate payment based on cab_type and distance
  # @params distance:float, cab_type:string
  # @return float
  def self.amount(distance, cab_type)
    dragoncoin = (distance * 2)
    (cab_type == 'pink') ? (return (dragoncoin + 5)) : (return dragoncoin)
  end
end
