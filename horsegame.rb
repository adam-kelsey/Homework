class Horse
  attr_accessor :name
  attr_accessor :location
  attr_accessor :speed
  def initialize
    self.name = "Horse1"
    self.location = 0
    self.speed = 1
  end
  
  def move_spaces *horse
    if location < 150
      self.location += (rand(8..13) * self.speed)
    else
      self.location = 150
    end
  end
end

class Track
  attr_accessor :length
  attr_accessor :stalls

  def initialize
    self.length = 150
    self.stalls = 4
  end

  def builder horses
    system("clear")
    horses.each do |n|
      puts
      self.length.times do
        print "-"
      end
      print "|"
      puts"\n\n"
      n.location.times do
        print "~"
      end
      puts "#{n.name.capitalize}"
      puts"\n"
      self.length.times do
        print "-"
      end
      print "|"
    end
    puts 
    puts
    horses.each do |i|
    print "#{i.name.capitalize} is at #{i.location} || "
    end
    puts
  end
end


horses = []
winning_horses = []
winning_locations = []
horse_names = ['ixion','santa','edens','man o war','muffinsHD','marky','snark','ares','dunky','Chronos','bahamut','clyde']
track = Track.new
system("clear")
puts "How many horses are competing?(2-8)"
horse_num = gets.chomp.to_i
horse_num.times do |horsey|
  new_horse = Horse.new
  new_horse.name = horse_names.pop
  horses.push(new_horse)
  horse_names = horse_names.shuffle
end

puts "Your horse is Clyde."
puts "Press enter to continue."
input = gets.chomp.downcase
if input == "cheat"
  puts "Enter a multiple"
  horses[0].speed = gets.chomp.to_i
end

while horses[0].location < 150 && 
  horses[1].location < 150 && 
  horses[2].location < 150 && 
  horses[3].location < 150
  track.builder(horses)
  horses.each do |i|
    i.move_spaces
  end
  sleep(0.85)
end
horses.each do |i|
  if i.location == 150 || i.location > 150
    winning_locations.push(i.location)
    i.location = 150
    track.builder(horses)
    winning_horses.push(i.name.capitalize)
  end
end

if winning_horses.length > 1
  locator = winning_locations.index(winning_locations.max)
  puts "It was close..."
  sleep(1)
  puts "The winning horse is: #{winning_horses[locator]}"
elsif winning_horses.length == 1
  puts "Winner:"
  puts winning_horses
end