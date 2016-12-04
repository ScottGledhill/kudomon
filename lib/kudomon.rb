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
    @coordinates[1] -= 1 if direction == 's'
    @coordinates[0] =+ 1 if direction == 'e'
    @coordinates[0] -= 1 if direction == 'w'
    kudomon_check(coordinates)
  end

  def nearby?
    locations = location.kudomon.map {|kudo| kudo[:location]}
    nearby = locations.any? {|loc| loc[0].between?(coordinates[0]-2,
    coordinates[0]+2) && loc[1].between?(coordinates[0]-2, coordinates[0]+2)}
    return 'Kudomon nearby, keep looking!' if nearby === true
    'nothing nearby'
  end

  private

  def kudomon_check(coordinates)
    return "Nothing here" if location.kudomon.any? {|kudo| kudo[:location] == coordinates} == false
    kudomon_add(coordinates)
  end

  def kudomon_add(coordinates)
    caught_kudo = location.kudomon.select{|kudo| kudo[:location] == coordinates }
    kudomon << caught_kudo[0]
    kudomon.uniq! {|kudo| kudo[:name] == caught_kudo[0][:name] }
    "#{caught_kudo[0][:name]} was added to your collection"
  end

  def kudomon_spawn
    location.create_random_location
  end
end
