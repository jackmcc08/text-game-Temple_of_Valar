require_relative "useful_information.rb"
require_relative "being.rb"

# find out how to create an inheritance from a super class

class Character < Being
  def initialize(name)
    @name = name
    @hit_points = rand(1..20) + 5
    @armour_class = 10
    @hit_bonus = 1
    @intelligence = 10
    @unarmed_damage = rand(1..4)
    @initative = 0
    @equipment = {
      :weapon => :sword,
      :shield => :basic_shield,
      :armour => 'none',
      :inventory => {
        :potions => "health_potion",
      }
    }
  end

  # all calls to base stats are in Being class

end

# test = Character.new("test")
# puts test.deal_damage
# puts test.equipment(:weapon)
# puts test.equipment(:shield)
# puts test.methods.inspect
