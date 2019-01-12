class SwCharacters::Species
  attr_accessor :name, :classification, :language, :species_id
  @@all = {}

  def initialize(name, classification, language, id)
    self.name = name
    self.classification = classification
    self.language = language
    self.species_id = id
    self.class.all[self.species_id] = self
  end

  def self.all
    @@all
  end
end
