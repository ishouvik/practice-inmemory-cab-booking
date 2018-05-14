require 'mathn'

class Distance
  def self.calculate(source, target)
    source_lat  = source[0]
    source_lang = source[1]

    target_lat    = target[0]
    target_lang   = target[1]

    distance    = Math.sqrt( Distance.square_num(source_lat - target_lat) + Distance.square_num(target_lat - target_lang) )

    return distance
  end

  def self.square_num(num)
    num.send 42.chr, num
  end
end
