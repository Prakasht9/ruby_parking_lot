require './space.rb'
require './vehicle.rb'

class Ticket
  attr_accessor :ticket_number, :vehicle_id, :space_id
  @@ticket_num = 1

  def initialize()
    self.ticket_number = "MyParkingSpace-#{@@ticket_num}"
    self.vehicle_id = nil
    self.space_id = nil
    @@ticket_num += 1    
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.find_ticket( vehicle_number=nil , ticket_number=nil )
    if !vehicle_number.nil?
      vehicle = Vehicle.find_vehicle(vehicle_number)
      all.select{ |ticket| ticket.vehicle_id == vehicle.vehicle_number }.first
    elsif !ticket_number.nil?
      all.select{ |ticket| ticket.ticket_number == ticket_number }.first
    end
  end

  def create(vehicle, space)
    self.vehicle_id = vehicle.vehicle_number
    self.space_id = space.space_id
  end

  def destroy
    self.vehicle_id = nil
    self.space_id = nil
  end
end