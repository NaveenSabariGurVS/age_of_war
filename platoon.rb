class Platoon
  attr_reader :units

  def initialize(platoon_data)
    @units = {}
    platoon_data.split(';').each do |unit_info|
      unit_class, count = unit_info.split('#')
      @units[unit_class] = count.to_i
    end
  end
end
