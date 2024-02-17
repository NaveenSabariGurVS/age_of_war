require_relative 'platoon'
require_relative 'battle'
require_relative 'war'

input_str="Spearmen#10;Militia#30;FootArcher#20;LightCavalry#1000;HeavyCavalry#120\nMilitia#10;Spearmen#10;FootArcher#1000;LightCavalry#120;CavalryArcher#100"
war = War.new(input_str)
winning_battles = war.get_winning_battles
result = war.get_first_winning_position(winning_battles)
puts "#{result}"
