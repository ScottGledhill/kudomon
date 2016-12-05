require 'require_all'
require_all 'lib'

module Spawn
  attr_reader :creatures, :kudomon
  include Electric
  include Fire
  include Grass
  include Psychic
  include Rock
  include Water

  def create_kudomon
    creatures = load_kudomon
    randomize_attributes(creatures)
  end

  def randomize_attributes(creatures)
    kudomon = []
    creatures.each do |creature|
      kudomon << Kudomon.new(creature[:name], creature[:type],
        random_hp_generation,
        random_cp_generation,
        random_spawn_location)
    end
    kudomon
  end

  def load_kudomon
    creatures = ELECTRIC['Chickapu'],ELECTRIC['BuzzElecta'],FIRE['Mancharred'],
    FIRE['FatFireFace'],GRASS['Sourbulb'],GRASS['Execute'],PSYCHIC['Sleepy'],
    PSYCHIC['Moooooow'],ROCK['Goodude'],ROCK['DwayneJohnson'],WATER['Psscannon'],
    WATER['Supersoka']
  end

  def random_hp_generation
    rand(200..1000)
  end

  def random_cp_generation
    rand(30..300)
  end

  def random_spawn_location
    [rand(-10..10),rand(-10..10)]
  end

  def set_sourbulb
    @kudomon.each{|kudo| kudo.location = [0,1] if kudo.name == "Sourbulb"}
  end
end
