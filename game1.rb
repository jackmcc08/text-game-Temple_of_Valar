require_relative = './character.rb'

def attack(hitMod, dmgMod, dmg, oppAC)
  hit_roll = rand(1..20) + hitMod
  if hit_roll < oppAC
    puts "Miss"
  else
    puts "Hit"
    dealDMG = rand(1..dmg) + dmgMod
    return dealDMG
  end
end

monster = {
  life => 10,

}
puts attack(2, 4, 12, 10)


todo:
- create rooms
- create character class
