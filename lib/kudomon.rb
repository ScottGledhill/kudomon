require 'kudomon_types/electric'

class Kudomon
  attr_reader :coordinates, :kudomon
  include Electric

  def initialize
    @coordinates = [0,0]
    @kudomon = [ELECTRIC_KUDOMON['Chickapu']]
  end
  # def move
  # end
end
