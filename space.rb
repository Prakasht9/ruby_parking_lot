class Space

  attr_accessor :space_id, :occupied
  def initialize()
    self.occupied = false
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.count
    all.count
  end

  def self.all_available
    self.all.select{ |obj| obj.occupied == false }
  end

  def self.all_occupied
    self.all.select{ |obj| obj.occupied == true }
  end

  def make_space_available
    self.occupied = false
  end

  def make_space_unavailable
    self.occupied = true
  end

  def self.find_space(space_number)
    all_occupied.select{ |space| space.space_id == space_number }.first
  end
end