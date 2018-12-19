class SwCharacters::Film
  attr_accessor :title, :opening_crawl, :director, :release_date, :film_id
  @@all = {}

  def initialize(title, opening_crawl, director, release_date, id)
    self.title = title
    self.opening_crawl = opening_crawl
    self.director = director
    self.release_date = release_date
    self.film_id = id
    self.class.all[self.film_id] = self
  end

  def self.all
    @@all
  end
end
