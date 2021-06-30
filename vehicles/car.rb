require './vehicle.rb'

class Car < Vehicle
  @@car_number = 1
  def initialize( model_number, owner_name, owner_number)
    self.vehicle_number = "Car-#{@@car_number}" 
    super(model_number ,owner_name ,owner_number)
    @@car_number += 1
  end
end