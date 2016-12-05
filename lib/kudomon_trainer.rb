require 'require_all'
require 'byebug'
require_all 'lib'

class KudomonTrainer
  attr_reader :coordinates, :kudomon, :kudomon_spawn
  attr_accessor :selected_fighter
  include Electric
  include Spawn

  def initialize
    @coordinates = [0, 0]
    @kudomon_spawn = create_kudomon
    @kudomon = []
    set_sourbulb
  end

  def randomly_choose_fighter
    @selected_fighter = kudomon.sample
  end

  def set_sourbulb
    @kudomon_spawn.each{|kudo| kudo.location = [0,1] if kudo.name == "Sourbulb"}
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

  private

  def kudomon_check(coordinates)
    return "Nothing here" if @kudomon_spawn.any? {|kudo| kudo.location == coordinates} == false
    kudomon_add(coordinates)
  end

  def kudomon_add(coordinates)
    caught_kudo = @kudomon_spawn.find {|kudo| kudo.location == coordinates }
    unless kudomon.include?(caught_kudo)
      kudomon << caught_kudo
      "#{caught_kudo.name} was added to your collection"
    end
  end
end
