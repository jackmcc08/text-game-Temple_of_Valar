require_relative "useful_information.rb"

class Being
  def initialize
    @hit_points = 0
    @armour_class = 0
    @hit_bonus = 0
    @intelligence = 0
    @unarmed_damage = 0
    @initative = 0
    @equipment = {
      :weapon => 'none',
      :shield => 'none',
      :armour => 'none',
      :inventory => {
        :potions => "health_potion",
      }
    }
  end

  def change_hp=(hit_points)
    @hit_points = hit_points
  end

  def increase_hp(amount)
    @hit_points = @hit_points + amount
  end

  def decrease_hp(amount)
    @hit_points = @hit_points - amount
  end

  def initative=(initative)
    @initative = initative
  end

  def name
    return @name
  end

  def hp
    return @hit_points
  end

  def ac
    total_ac = @armour_class + self.ac_buff
    return total_ac
  end

  def ac_buff
    buff = 0
    buff += EQUIPMENT_FIND[self.equipment(:shield)] if self.equipment(:shield) != 'none'
    buff += EQUIPMENT_FIND[self.equipment(:armour)] if self.equipment(:armour) != 'none'
    buff
  end

  def hit_bonus
    return @hit_bonus
  end

  def int
    return @intelligence
  end

  def unarmed_damage
    return @unarmed_damage
  end

  def equipment(category)
    return @equipment[category]
  end

  def initative
    return @initative
  end

  def deal_damage
    if self.equipment(:weapon) != ""
      return EQUIPMENT_FIND[self.equipment(:weapon)]
    else
      return self.unarmed_damage
    end
  end

  def information
    puts "Type what information you want - all, name, hit_points, armour_class, hit_bonus, intelligence"
    info = gets.chomp.downcase

    info_hash = {
      "name" => @name,
      "hit_points" => @hit_points,
      "armour_class" => @armour_class,
      "hit_bonus" => @hit_bonus,
      "intelligence" => @intelligence,
    }

    if info == "" || info == "all"
      info_hash.each { |x,y| puts "#{x}: #{y}" }
    elsif info_hash.include?(info)
      puts info_hash[info]
    else
      puts "does not have that info"
    end
  end
end
