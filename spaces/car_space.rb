require './space.rb'

class BikeSpace < Space
  @@bike_space_id = 0
  def initialize()
    super()
    self.space_id = "BikeSpace-#{@@bike_space_id}"
    @@bike_space_id += 1
  end
end