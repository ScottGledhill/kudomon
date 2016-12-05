require 'require_all'
require_all 'lib'

class Spawn
  attr_reader :creatures
  include Electric
  include Fire
  include Grass
  include Psychic
  include Rock
  include Water

  def initialize
    @creatures = load_kudomon
    randomize_attributes
    set_sourbulb
  end

  def randomize_attributes
    @creatures.each do |creature|
      Kudomon.new(creature[:name], creature[:type],
        creature.store(:HP, rand(100..1000)),
        creature.store(:CP, rand(30..300)),
        creature.store(:location, [rand(-10..10),rand(-10..10)]))
    end
  end

  def set_sourbulb
    creatures.each{|kudo| kudo[:location] = [0,1] if kudo[:name]== "Sourbulb"}
  end

  def randomize_location
    p creatures.map {|kudo| kudo.store(:location, [rand(-10..10),rand(-10..10)])}
    creatures.each{|kudo| kudo[:location] = [0,1] if kudo[:name]== "Sourbulb"}
  end

  def load_kudomon
    @creatures = ELECTRIC['Chickapu'],ELECTRIC['BuzzElecta'],FIRE['Mancharred'],
    FIRE['FatFireFace'],GRASS['Sourbulb'],GRASS['Execute'],PSYCHIC['Sleepy'],
    PSYCHIC['Moooooow'],ROCK['Goodude'],ROCK['DwayneJohnson'],WATER['Psscannon'],
    WATER['Supersoka']
  end
end
