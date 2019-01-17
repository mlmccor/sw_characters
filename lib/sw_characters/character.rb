class SwCharacters::Character

  attr_accessor :name, :homeworld, :films, :species, :character_id
  
  @@all = {}

  def initialize(name, homeworld, films, species, character_id)
    self.name = name
    self.homeworld = homeworld
    self.films = films
    self.species = species
    self.character_id = character_id
    self.class.all[character_id] = self
  end

  def self.all
    @@all
  end

end
