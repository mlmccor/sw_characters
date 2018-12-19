class SwCharacters::Planet
  attr_accessor :name, :planet_id
  @@all = {}

  def initialize(name, id)
    self.name = name
    self.planet_id = id
    self.class.all[self.planet_id] = self
  end

  def self.all
    @@all
  end

  
end
