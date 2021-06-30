require './space.rb'
class CarSpace < Space
  @@car_space_id = 0
  def initialize()
    super()
    self.space_id = "CarSpace-#{@@car_space_id}"
    @@car_space_id += 1
  end

end