require_relative "useful_information.rb"
require_relative "being.rb"

class Monster < Being
  def initialize(name = "Grog")
    @name = name
    @hit_points = rand(5..15)
    @armour_class = 10
    @hit_bonus = 0
    @intelligence = 8
    @unarmed_damage = rand(1..6)
    @initative = 0
    @equipment = {
      :weapon => :spear,
      :shield => :basic_shield,
      :armour => 'none',
      :inventory => {
        :potions => 'none',
      }
    }
  end

    # all calls to base stats are in Being class

end
