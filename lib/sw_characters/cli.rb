require 'pry'


class SwCharacters::CLI

  def run
    SwCharacters::API.load_planets
    SwCharacters::API.load_films
    SwCharacters::API.load_species
    SwCharacters::API.load_characters
    puts ""
    puts "
██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗
██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝
██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗
██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝
╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗
 ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝

"
    puts "Welcome to the Star Wars Character Database!"
    puts ""
    self.menu
  end

  def menu
    puts ""
    puts "1. List all Characters"
    puts "2. List all Planets"
    puts "3. List all Films"
    puts "4. List all Species"
    puts "5. Search Characters by name"
    input = gets.strip
    case input
    when '1'
      self.list_characters
    when '2'
      self.list_planets
    when '3'
      self.list_films
    when '4'
      self.list_species
    when '5'
      self.search_characters
    end
  end

  def return_to_menu
    puts ""
    puts "Type 1 to return to the main menu"
    input = gets.chomp
    input == '1' ? self.menu : nil
  end


  def list_characters
    puts ""
    sorted = SwCharacters::Character.all.sort_by {|id, character| id.to_i}
    sorted.each do |character|
      puts "#{character[0]}. #{character[1].name}"
    end
    puts "Select a character number or type menu for main menu"
    input = gets.chomp
    if input == 'menu'
      self.menu
    elsif SwCharacters::Character.all.keys.include?(input)
      self.display_character(input)
    end
  end

  def display_character(input)
    puts ""
    puts "#{SwCharacters::Character.all[input].name}"
    puts "Homeworld: #{SwCharacters::Character.all[input].homeworld.name}"
    if SwCharacters::Character.all[input].species == 'unknown'
      puts "Species: unknown"
    else
      puts "Species: #{SwCharacters::Character.all[input].species.name}"
    end
    puts "Films:"
    puts ""
    SwCharacters::Character.all[input].films.each {|film| puts "#{film.title}"}
    self.return_to_menu
  end

  def list_planets
    puts ""
    sorted = SwCharacters::Planet.all.sort_by {|id, planet| id.to_i}
    sorted.each do |planet|
      puts "#{planet[0]}. #{planet[1].name}"
    end
    puts "Select a planet number or type menu for main menu"
    input = gets.chomp
    if input == 'menu'
      self.menu
    elsif (SwCharacters::Planet.all.keys).include?(input)
      self.display_planet(input)
    end
  end

  def display_planet(input)
    puts ""
    puts "#{SwCharacters::Planet.all[input].name}"
    puts "Natives:"
    SwCharacters::Character.all.each do |id, character|
      if character.homeworld.name == SwCharacters::Planet.all[input].name
        puts "#{character.name}"
      end
    end
    self.return_to_menu
  end

  def list_films
    puts ""
    sorted = SwCharacters::Film.all.sort_by {|id, planet| id.to_i}
    sorted.each do |film|
      puts "#{film[0]}. #{film[1].title}"
    end
    puts "Select a film number or type menu for main menu"
    input = gets.chomp
    if input == 'menu'
      self.menu
    elsif (SwCharacters::Film.all.keys).include?(input)
      self.display_film(input)
    end
  end

  def display_film(input)
    puts ""
    puts "Title: #{SwCharacters::Film.all[input].title}"
    puts "Director: #{SwCharacters::Film.all[input].director}"
    puts "Release Date: #{SwCharacters::Film.all[input].release_date}"
    puts "Opening Crawl:"
    puts ""
    puts "#{SwCharacters::Film.all[input].opening_crawl.strip}"
    self.return_to_menu
  end

  def list_species
    puts ""
    sorted = SwCharacters::Species.all.sort_by {|id, species| id.to_i}
    sorted.each do |species|
      puts "#{species[0]}. #{species[1].name}"
    end
    puts ""
    puts "Select a species number or type menu for main menu"
    input = gets.chomp
    if input == 'menu'
      self.menu
    elsif (SwCharacters::Species.all.keys).include?(input)
      self.display_species(input)
    end
  end

  def display_species(input)
    puts ""
    puts "Name: #{SwCharacters::Species.all[input].name}"
    puts "Classification: #{SwCharacters::Species.all[input].classification}"
    puts "Language: #{SwCharacters::Species.all[input].language}"
    puts "Example Characters:"
    puts ""
    SwCharacters::Character.all.each do |id, character|
      if character.species != 'unknown'
        if character.species.name == SwCharacters::Species.all[input].name
          puts "#{character.name}"
        end
      end
    end
    self.return_to_menu
  end

  def search_characters
    puts ''
    puts 'Please type the name of a character'
    puts 'For best results, type only one part of their name and omit titles like "General"'
    input = gets.chomp
    results = SwCharacters::Character.all.select do |id, character|
      character.name.include?(input)
    end
    if results.length == 0
      puts ""
      "No results, please try another search"
      self.search_characters
    elsif results.length == 1
      self.display_character(results.values.first.character_id)
    else
      self.display_results(results)
    end
  end

  def display_results(results)
    puts ""
    results.each {|index, character| puts "#{index}. #{character.name}"}
    puts ''
    puts "Please type the number of the entry you were searching for or type search to try again."
    input= gets.chomp
    if input == 'search'
      self.search_characters
    elsif results.keys.include?(input)
      self.display_character(results[input].character_id)
    end
  end

end
