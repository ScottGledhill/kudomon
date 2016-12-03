require 'location'

class Kudomon
  attr_reader :coordinates, :kudomon, :location
  include Electric

  def initialize
    @coordinates = [0, 0]
    @kudomon = [ELECTRIC['Chickapu']]
    @location = Location.new
    kudomon_spawn
  end

  def move(direction)
    @coordinates[1] =+ 1 if direction == 'n'
    @coordinates[1] =- 1 if direction == 's'
    @coordinates[0] =+ 1 if direction == 'e'
    @coordinates[0] =- 1 if direction == 'w'
  end

  def kudomon_check(coordinates)
     location.kudomon.select {|kudo| kudo[:location] == coordinates }
  end

  def kudomon_save

  end
  private

  def kudomon_spawn
    location.create_random_location
  end
end
