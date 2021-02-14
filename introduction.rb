#introduction
def introduction
  puts "would you like to hear the instructions? Type Y or N"
  active = "yes"
  while active == "yes" do
    decision = gets.chomp.upcase
    if decision == 'Y'
      puts INTRO_TEXT
      active = "no"
    elsif decision == 'N'
      active = "no"
    else
      puts 'please type Y or N'
    end
  end

  puts "Press Enter to start"
  gets.chomp
end

INTRO_TEXT = "The temple of Valar is a proving ground for hopeful warriors who want to join the ranks of the temple legions.
The temple legions are one of the key protective forces in the land of Pelor, a theocratic kingdom where the kings rules by divine right.
The trials consist of a number of rooms, a minimum of five, which test both strength and intelligence.
Success in the intelligence rooms are not required, but not succeding will place you lower on the guard heirarchy.
Success in the strength rooms is required, failure is death....not all warriors need to be intelligence, but all need to be able to fight.
The more rooms you complete, the higher your blessing from Valar.

For strength rooms:
- each room is a 10 by 10 square, you will need to defeat the monster within
- it is a turn based affair
- a map of the room will be printed in each turn, there may be obstacles in the room
- you have two actions per turn

Actions are as follows:
- attack: attacks the opponent with your weapon
- defend: reduces the damage recieved on the next immediate turn
- move: you can move one square in the direction chosen
- charge: move forward two squares and attack (consumes both actions)
- rush: move any direction two squares (consumes both actions)
- heal: if you have a healing potion, it will consume the healing potion and restore some health, if no healing potion it will restore 1 hit point.
"
#
# puts INTRO_TEXT
