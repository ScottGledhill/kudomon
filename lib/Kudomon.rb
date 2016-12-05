class Kudomon
  attr_reader :name, :type, :hp, :cp, :location
  attr_writer :location, :hp
  def initialize(name, type, hp, cp, location)
    @name = name
    @type = type
    @hp = hp
    @cp = cp
    @location = location
  end
end
