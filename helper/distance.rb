require 'mathn'

class Distance
  def self.calculate(pickup, drop)
    pickup_lat = pickup[0]
    pickup_lang = pickup[1]

    drop_lat = drop[0]
    drop_lang = drop[1]

    distance = Math.sqrt( Distance.square_num(pickup_lat - drop_lat) + Distance.square_num(drop_lat - drop_lang) )

    return distance
  end

  def self.square_num(num)
    num.send 42.chr, num
  end
end
