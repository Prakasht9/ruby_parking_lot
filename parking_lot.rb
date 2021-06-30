#!/usr/bin/env ruby

require './space.rb'
require './vehicle.rb'
require './ticket.rb'
require './seed_data.rb'

class SystemFunction

  def self.list_all_space(type=nil)
    if type.nil?
      Space.available
    else
      Object.const_get("#{type.capitalize}Space").all_available
    end
  end

  def self.find_vehicle(vehicle_number=nil, ticket_number=nil)
    space_ticket = nil
    if !vehicle_number.nil? || !ticket_number.nil? 
      space_ticket = Ticket.find_ticket(vehicle_number, ticket_number)
    else
      p 'Please provide Vehicle Number or Ticket Number'
      return
    end

    if !space_ticket.nil?
      vehicle = Vehicle.find_vehicle(space_ticket.vehicle_id)
    end

    if !vehicle.nil?
      puts vehicle.vehicle_number
    else
      puts 'Vehicle Not Parked'
    end
  end

  def self.park_vehicle(vehicle_number)
    vehicle = Vehicle.find_vehicle(vehicle_number)
    space = Object.const_get("#{vehicle.vehicle_number.split("-")[0]}Space").all_available.first
    
    if space.nil?
      "No space present"
    else
      ticket = Ticket.new
      ticket.create(vehicle, space)

      if !ticket.nil?
        space.make_space_unavailable()
      end
      puts ticket.ticket_number
    end
  end

  def self.unpark_my_vehicle(vehicle_number=nil, ticket_number=nil)
    # find_ticket
    # find_space
    # update_ticket
    # update_space

    parked_ticket = nil
    if !vehicle_number.nil? || !ticket_number.nil? 
      parked_ticket = Ticket.find_ticket(vehicle_number, ticket_number)
    else
      p 'Please provide Vehicle Number or Ticket Number'
      return
    end

    parked_space = nil
    if !parked_ticket.nil?
      parked_space = Space.find_space(parked_ticket.space_id)
      puts 'Vehicle Found'
    end

    if !parked_space.nil?
      parked_ticket.destroy()
      parked_space.make_space_available()
    end
    
    if parked_space.occupied == false
      puts 'Vehicle unparked'
    end
  end
end

# require './parking_lot.rb'
# puts Space.all 
# puts Vehicle.all 
# SeedData.seed_space
# SystemFunction.list_all_space
# SystemFunction.park_vehicle('Car-5')
# SystemFunction.find_vehicle('Car-5')
# SystemFunction.find_vehicle(nil, 'Car-5')
# SystemFunction.unpark_my_vehicle(nil, 'Car-5')