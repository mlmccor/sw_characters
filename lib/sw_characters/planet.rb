class SwCharacters::Planet
  attr_accessor :name, :planet_id, :climate, :terrain
  @@all = {}

  def initialize(name, id, climate, terrain)
    self.name = name
    self.planet_id = id
    self.climate = climate
    self.terrain = terrain
    self.class.all[self.planet_id] = self
  end

  def self.all
    @@all
  end


end
