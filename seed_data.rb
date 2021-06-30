require './spaces/car_space.rb'
require './spaces/bike_space.rb'
require './vehicles/car.rb'
require './vehicles/bike.rb'

class SeedData
  def self.seed_space
    carspace1 = CarSpace.new()
    bikespace1 = BikeSpace.new()
    carspace2 = CarSpace.new()
    bikespace2 = BikeSpace.new()
    carspace3 = CarSpace.new()
    bikespace3 = BikeSpace.new()
    carspace4 = CarSpace.new()
    bikespace4 = BikeSpace.new()
    carspace5 = CarSpace.new()
    bikespace5 = BikeSpace.new()
    bike1 = Bike.new('bike-1', 'bike-1', 'bike-123-1')
    car1 = Car.new('car-1', 'car-1', 'car-123-1')
    bike2 = Bike.new('bike-2', 'bike-2', 'bike-123-2')
    car2 = Car.new('car-2', 'car-2', 'car-123-2')
    bike3 = Bike.new('bike-3', 'bike-3', 'bike-123-3')
    car3 = Car.new('car-3', 'car-3', 'car-123-3')
    bike4 = Bike.new('bike-4', 'bike-4', 'bike-123-4')
    car4 = Car.new('car-4', 'car-4', 'car-123-4')
    bike5 = Bike.new('bike-5', 'bike-5', 'bike-1-523')
    car5 = Car.new('car-5', 'car-5', 'car-123-5')
  end
end