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
    kudomon_check?(coordinates)
  end

  def kudomon_check?(coordinates)
    caught_kudo = location.kudomon.select {|kudo| kudo[:location] == coordinates} ? kudomon << caught_kudo : "nothing"
    # "You have found a #{caught_kudo[0][:name]}, it has been added to your Kudomon Collection"
  end

  private

  def kudomon_spawn
    location.create_random_location
  end
end
