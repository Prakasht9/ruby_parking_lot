require './vehicle.rb'

class Bike < Vehicle
  @@bike_number = 1
  def initialize( model_number, owner_name, owner_number)
    self.vehicle_number = "Bike-#{@@bike_number}"
    super(model_number ,owner_name ,owner_number)
    @@bike_number += 1
  end
end