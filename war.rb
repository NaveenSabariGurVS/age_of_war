require_relative 'platoon'
require_relative 'battle'

class War
  attr_reader :battles

  def initialize(platoons_data)
    own_platoons_data, opponent_platoons_data = platoons_data.split("\n")
    @own_platoons = Platoon.new(own_platoons_data)
    @opponent_platoons = Platoon.new(opponent_platoons_data)
    @battles = []
    determine_battles
  end

  def determine_battles
    @battles << Battle.new(@own_platoons, @opponent_platoons)
    @battles.each(&:determine_advantage)
  end

  def get_winning_battles
    @battles[0].advantage.select { |_, value| value == "Win" }
  end

  def get_first_winning_position(winning_battles)
    winning_strategy = []
    opponent_platoons_units = @opponent_platoons.units.keys
    own_remaining_position = @own_platoons.units.keys
    opponent_platoons_units.each do |opponent_unit|
      own_units = winning_battles.select { |key, _| key[1] == opponent_unit }.map{ |key, value| key.first }
      own_units.each do |own_unit|
          if !winning_strategy.include?(own_unit) && own_remaining_position.include?(own_unit)
              winning_strategy << own_unit
              own_remaining_position.delete(own_unit)
              break
          end
      end
    end
    if winning_strategy.size < 3
      return "There is no chance of winning" 
    elsif winning_strategy.size != opponent_platoons_units.size
      winning_strategy += own_remaining_position
    end
    format_platoon(winning_strategy)
  end

  private 

  def format_platoon(units_order)
    units_order.map { |unit| "#{unit}##{@own_platoons.units[unit]}" }.join(';')
  end
end
