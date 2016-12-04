require 'require_all'
require_all 'lib'

class Spawn
  attr_reader :creatures
  include Electric
  include Fire
  include Grass
  include Pyschic
  include Rock
  include Water

  def initialize
    @creatures = [ELECTRIC['Chickapu'],ELECTRIC['BuzzElecta'],FIRE['Mancharred'],
    FIRE['FatFireFace'],GRASS['Sourbulb'],GRASS['Execute'],PYSCHIC['Sleepy'],
    PYSCHIC['Moooooow'],ROCK['Goodude'],ROCK['DwayneJohnson'],WATER['Psscannon'],
    WATER['Supersoka']]
  end

  def create_random_spawn
    creatures.map {|kudo| kudo.store(:HP, rand(100..1000))}
    creatures.map {|kudo| kudo.store(:CP, rand(30..300))}
    creatures.map {|kudo| kudo.store(:location, [rand(-20..20),rand(-20..20)])}
    creatures.each{|kudo| kudo[:location] = [0,1] if kudo[:name]== "Sourbulb"}
  end
end
