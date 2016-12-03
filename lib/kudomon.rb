require 'location'

class Kudomon
  attr_reader :coordinates, :kudomon
  include Electric

  def initialize
    @coordinates = [0, 0]
    @kudomon = [ELECTRIC['Chickapu']]
    kudomon_spawn
  end

  def move(direction)
    @coordinates[1] =+ 1 if direction == 'n'
    @coordinates[1] =- 1 if direction == 's'
    @coordinates[0] =+ 1 if direction == 'e'
    @coordinates[0] =- 1 if direction == 'w'
  end

  def check_for_kudomon
    coordinates
  end

  def kudomon_spawn
    Location.new.create_random_location
  end
end
