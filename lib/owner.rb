class Owner
  attr_accessor :name, :pets
  attr_reader :species

  @@all = []

  def initialize(species)
    @species = species
    @pets = {fishes: [], dogs: [], cats: []}
    @@all.push(self)
  end

  def self.all
    @@all
  end

  def say_species
    return "I am a #{species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    pets[:fishes].push(fish)
  end

  def buy_cat(name)
    cat = Cat.new(name)
    pets[:cats].push(cat)
  end

  def buy_dog(name)
    dog = Dog.new(name)
    pets[:dogs].push(dog)
  end

  def walk_dogs
    pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
    pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets
    pets.each do |type, pets|
      pets.each {|pet| pet.mood = "nervous"}
    end
    @pets = {fishes: [], dogs: [], cats: []}
  end

  def list_pets
    return "I have #{pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
  end

  def self.reset_all
    @@all = []
  end

  def self.count
    @@all.count
  end
end
