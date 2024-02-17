module Advantage
    ADVANTAGE_OVER = {
      "Militia" => ["Spearmen", "LightCavalry"],
      "Spearmen" => ["LightCavalry", "HeavyCavalry"],
      "LightCavalry" => ["FootArcher", "CavalryArcher"],
      "HeavyCavalry" => ["Militia", "FootArcher", "LightCavalry"],
      "FootArcher" => ["Spearmen", "HeavyCavalry"],
      "CavalryArcher" => ["Militia", "CavalryArcher"]
    }.freeze
  
    def advantage_over
      ADVANTAGE_OVER
    end
end
  