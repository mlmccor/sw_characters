require 'open-uri'
require 'nokogiri'
require 'json'

class SwCharacters::API

  def self.load_characters
    x = 1
    until x == 10
      data = open("https://swapi.co/api/people/?page=#{x}&format=json").read
      my_hash = JSON.parse(data)
      people = my_hash['results']
      people.each do |person|
        if person['species'].length == 0
          species_hash = {'1' => 'unknown'}
        else
          species_hash = SwCharacters::Species.all.select do |key, value|
            key == person['species'].first.split('/').last
          end
        end
        planet_hash = SwCharacters::Planet.all.select do |key, value|
          key == person['homeworld'].split('/').last
        end
        film_ids = person['films'].map {|film_url| film_url.split('/').last}
        film_hashes = SwCharacters::Film.all.select do |film_id, film|
          film_ids.include?(film.film_id)
        end
        films = film_hashes.map {|key, value| value}
        SwCharacters::Character.new(person['name'], planet_hash.values[0], films, species_hash.values[0], person['url'].split('/').last)
      end
      x += 1
    end
  end

  def self.load_planets
    x = 1
    until x == 8
      data = open("https://swapi.co/api/planets/?page=#{x}&format=json").read
      my_hash = JSON.parse(data)
      planets = my_hash['results']
      planets.each do |planet|
        id = planet['url'].split('/').last
        SwCharacters::Planet.new(planet['name'], id, planet['climate'], planet['terrain'])
      end
      x += 1
    end
  end

  def self.load_films
      data = open("https://swapi.co/api/films/?format=json").read
      my_hash = JSON.parse(data)
      films = my_hash['results']
      films.each do |film|
        id = film['url'].split('/').last
        SwCharacters::Film.new(film['title'],film['opening_crawl'],film['director'],film['release_date'], id)
      end
  end

  def self.load_species
    x = 1
    until x == 5
      data = open("https://swapi.co/api/species/?page=#{x}&format=json").read
      my_hash = JSON.parse(data)
      species = my_hash['results']
      species.each do |species|
        id = species['url'].split('/').last
        SwCharacters::Species.new(species['name'],species['classification'],species['language'], id)
      end
      x += 1
    end
  end

end
