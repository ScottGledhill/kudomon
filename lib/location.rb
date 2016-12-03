require 'kudomon_types/electric'
require 'kudomon_types/fire'
require 'kudomon_types/grass'
require 'kudomon_types/psychic'
require 'kudomon_types/rock'
require 'kudomon_types/water'

class Location
  attr_reader :kudomon
  include Electric
  include Fire
  include Grass
  include Pyschic
  include Rock
  include Water

  def initialize
    @kudomon = [ELECTRIC['Chickapu'],ELECTRIC['BuzzElecta'],FIRE['Mancharred'],
    FIRE['FatFireFace'],GRASS['Sourbulb'],GRASS['Execute'],PYSCHIC['Sleepy'],
    PYSCHIC['Moooooow'],ROCK['Goodude'],ROCK['DwayneJohnson'],WATER['Psscannon'],
    WATER['Supersoka']]
  end

  def create_random_location
    kudomon.map {|kudo| kudo.store(:location, [rand(-20..20),rand(-20..20)])}
  end

  def current_location
    kudomon.map {|kudo| kudo}
  end
end
