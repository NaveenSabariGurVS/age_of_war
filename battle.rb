require_relative 'advantage'

class Battle
  attr_reader :own_platoon, :opponent_platoon, :advantage
  include Advantage

  def initialize(own_platoon, opponent_platoon)
    @own_platoon = own_platoon
    @opponent_platoon = opponent_platoon
    @advantage = {}
  end

  def determine_advantage
    @own_platoon.units.each do |own_unit_type, own_count|
      @opponent_platoon.units.each do |opponent_unit_type, opponent_count|
        if own_unit_type == opponent_unit_type
          @advantage[[own_unit_type, opponent_unit_type]] = own_count > opponent_count ? "Win" : (own_count == opponent_count ? "Draw" : "Lose")
        else
          if advantage_over[own_unit_type].include?(opponent_unit_type)
            @advantage[[own_unit_type, opponent_unit_type]] = own_count * 2 > opponent_count ? "Win" : (own_count * 2 == opponent_count ? "Draw" : "Lose")
          else
            @advantage[[own_unit_type, opponent_unit_type]] = own_count > opponent_count * 2 ? "Win" : (own_count == opponent_count * 2 ? "Draw" : "Lose")
          end
        end
      end
    end
  end
end
