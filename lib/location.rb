require 'kudomon_types/electric'
require 'kudomon_types/fire'
require 'kudomon_types/grass'
require 'kudomon_types/psychic'
require 'kudomon_types/rock'
require 'kudomon_types/water'

class Location
  include Electric
  include Fire
  include Grass
  include Pyschic
  include Rock
  include Water

  def create_random_location

  end
end
