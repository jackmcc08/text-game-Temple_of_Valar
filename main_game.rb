require_relative "character.rb"
require_relative "monster.rb"
require_relative "useful_methods.rb"
require_relative "useful_information.rb"
require_relative "introduction.rb"
require_relative "being.rb"
require_relative "combat_methods.rb"

puts "Welcome to the Temple of Trials\n
Survive these trials and you shall become one of the chosen of Valar\n\n"
#>> hold

puts "Supplicant, what is your name?"
name = "Ragnar" #>> gets.chomp
$player = Character.new(name)

puts "\nWelcome #{$player.name}, your trials await...\n\n"

#>> hold

#>>introduction

puts "Welcome to the first room, the trial of basic fighting"

room_name = "room_1"

$opponents = [ monster_1 = Monster.new("goblin 1")]#, monster_2 = Monster.new("goblin 2")]
$participants = [$player, $opponents].flatten
#other_contents = [treasure_chest_1 = Treasure.new]

puts "player hp: #{$player.hp}, monster hp: #{$opponents[0].hp}"
$combat_status = "fight"
turn_counter = 0

# turn($participants[1], $participants)

while $combat_status == "fight"
  whose_turn = $participants[turn_counter]
  turn(whose_turn)
  puts "$player hp: #{$player.hp}, monster hp: #{monster_1.hp}"
  turn_counter < $participants.length - 1 ? turn_counter += 1 : turn_counter = 0
  # puts "turn_counter #{turn_counter}"


end


#






# def fight_sequence(participants)
#   puts "roll for initiative"
#   participants.each do |x|
#     x.initative=(rand(1..20))
#   end
#   participants.sort! { |a, b| a.initative <=> b.initative }
#   puts participants.inspect
#
#   status = "fight"
#
#   while status == "fight" do
#     counter = 0
#     #move
#     #select target
#     #participant[0].attack
#
#
#     if participants[counter + 1].hp <= 0
#       puts "creature dead"
#       status = "over"
#     end
#
#   end
# end

# fight_sequence([$player, monster_1])
