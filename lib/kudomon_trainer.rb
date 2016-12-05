require_relative 'spawn'

class KudomonTrainer
  attr_reader :coordinates, :kudomon, :kudomon_spawn
  include Electric
  include Spawn

  def initialize
    @coordinates = [0, 0]
    @kudomon = [ELECTRIC['Chickapu']]
    @kudomon_spawn = create_kudomon
  end

  def move(direction)
    if coordinates[0].between?(-10,10) && coordinates[1].between?(-10,10)
      @coordinates[1] += 1 if direction == 'n'
      @coordinates[1] -= 1 if direction == 's'
      @coordinates[0] += 1 if direction == 'e'
      @coordinates[0] -= 1 if direction == 'w'
      kudomon_check(coordinates)
    else
      @coordinates = [0,0]
      'reached edge of the map, go back to the start'
    end
  end

  # def nearby?
  #   locations = kudomon_spawn.creatures.map {|kudo| kudo[:location]}
  #   nearby = locations.any? {|loc| loc[0].between?(coordinates[0]-2,
  #   coordinates[0]+2) && loc[1].between?(coordinates[0]-2, coordinates[0]+2)}
  #   return 'Kudomon nearby, keep looking!' if nearby === true
  #   'nothing nearby'
  # end

  private

  def kudomon_check(coordinates)
    return "Nothing here" if create_kudomon.any? {|kudo| kudo[:location] == coordinates} == false
    kudomon_add(coordinates)
  end
  #
  # def kudomon_add(coordinates)
  #   caught_kudo = kudomon_spawn.creatures.select{|kudo| kudo[:location] == coordinates }
  #   kudomon << caught_kudo[0]
  #   kudomon.uniq! {|kudo| kudo[:name] == caught_kudo[0][:name] }
  #   "#{caught_kudo[0][:name]} was added to your collection"
  # end

  def kudomon_add(coordinates)
    caught_kudo = create_kudomon.select {|kudo| kudo[:location] == coordinates }
    kudomon << caught_kudo
    kudomon.uniq!
    "#{caught_kudo[0][:name]} was added to your collection"
  end
end
