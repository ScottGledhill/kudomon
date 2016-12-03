require 'kudomon_types/electric'

class Kudomon
  attr_reader :coordinates, :kudomon
  include Electric

  def initialize
    @coordinates = [0,0]
    @kudomon = [Electric]
  end
  # def move
  # end
end
