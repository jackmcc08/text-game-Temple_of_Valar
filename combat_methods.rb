COMBAT_ACTIONS = ['Attack', 'Defend', 'Move', 'Potion']

def attack(attacker, defender) #write monster descriptions
  attack_roll = rand(1..20) + attacker.hit_bonus
  if attack_roll >= defender.ac
    puts "You hit the monster." if attacker == $player
    puts "The monster hit's you" if attacker != $player
    damage = attacker.deal_damage
    puts "You deal #{damage} damage!" if attacker == $player
    puts "The monster deals you #{damage} damage" if attacker != $player
    defender.decrease_hp(damage)
  else
    puts "You missed" if attacker == $player
    puts "The monster missed" if attacker != $player
  end
  hold
end

def defend

end

def move

end

def potion

end

def death_check(victim)
  if victim.hp <= 0
    return "dead"
  else
    return "alive"
  end
end

def decision(being)
  if being == $player
    decision_index = COMBAT_ACTIONS.length
    until decision_index >= 0 && decision_index < COMBAT_ACTIONS.length
      puts "What do you want to do?"
      COMBAT_ACTIONS.map.with_index { |action, index| puts "#{index + 1} => #{action}" }
      decision_index = gets.chomp.to_i
      if decision_index > 0 && decision_index <= COMBAT_ACTIONS.length
        decision_index -= 1
        puts "\nYou selected #{COMBAT_ACTIONS[decision_index]}.\n"
        $decision = COMBAT_ACTIONS[decision_index]
      else
        puts "\nYou did not select a valid action. Please select a valid action\n"
      end
    end
  else
    $decision = COMBAT_ACTIONS[0] # monster_action_matrix
    puts "\nThe monster #{$decision.downcase}\'s you!\n"
  end
end

def target(being)
  if $decision == COMBAT_ACTIONS[0] #Attack
    target = String.new
    if being == $player
      until $opponents.include?($target)
        puts "\nSelect target number:\n"
        $opponents.map.with_index {|opponent, index| puts "#{index + 1} => #{opponent.name}" }
        target_index = gets.chomp.to_i
        if target_index > 0 && target_index <= $opponents.length
          target_index -= 1
          puts "\nYou are targeting #{$opponents[target_index].name}.\n"
          $target = $opponents[target_index]
        else
          puts "\nYou did not select a valid target. Please select a  valid target\n"
        end
      end
    else
      $target = $player
    end
  end
end

def turn(being)
  # decision
  decision(being)

  #Targeter
  target(being)

  #attack function called
  attack(being, $target)

  # death check called, then checks if combat is over
  if death_check($target) == "dead"
    if $target == $player
      puts "#{$player.name} died a grusome death!\n\n"
      puts "Game Over!"
      #game_over - build game_over sequence
    else
      $opponents.delete($target)
      if $opponents.length < 1
        puts "#{$player.name} wins the combat."
        $combat_status = "over"
      end
    end
  end

end
