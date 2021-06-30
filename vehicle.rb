class Vehicle
  attr_accessor :vehicle_number , :model_number, :owner_name, :owner_number
  
  def initialize( model_number, owner_name, owner_number)
    self.model_number = model_number 
    self.owner_name = owner_name 
    self.owner_number = owner_number 
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.find_vehicle(vehicle_number)
    all.select{ |vehicle| vehicle_number == vehicle.vehicle_number }.first
  end

end