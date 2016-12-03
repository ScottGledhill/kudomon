require 'kudomon_types/electric'

class Kudomon
  attr_reader :coordinates, :kudomon, :x, :y
  include Electric

  def initialize
    @coordinates = [0, 0]
    @kudomon = [ELECTRIC_KUDOMON['Chickapu']]
  end

  def move(direction)
    @coordinates[1] =+ 1 if direction == 'n'
    @coordinates[1] -= 1 if direction == 's'
    @coordinates[0] =+ 1 if direction == 'e'
  end
end
