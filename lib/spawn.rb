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
    # create instances of kudo
    randomize_attributes(creatures)
    # set_sourbulb
  end

  def randomize_attributes(creatures)
    kudomon = []
    creatures.each do |creature|
      kudomon << Kudomon.new(creature[:name], creature[:type],
        rand(200..1000),
        rand(30..300),
        [rand(-10..10),rand(-10..10)])
    end
    kudomon
  end

  def random_spawn_location
    location = [rand(-10..10),rand(-10..10)]
  end

  def load_kudomon
    creatures = ELECTRIC['Chickapu'],ELECTRIC['BuzzElecta'],FIRE['Mancharred'],
    FIRE['FatFireFace'],GRASS['Sourbulb'],GRASS['Execute'],PSYCHIC['Sleepy'],
    PSYCHIC['Moooooow'],ROCK['Goodude'],ROCK['DwayneJohnson'],WATER['Psscannon'],
    WATER['Supersoka']
  end

  def set_sourbulb
    byebug
    @kudomon.each{|kudo| kudo.location = [0,1] if kudo.name == "Sourbulb"}
  end
end
