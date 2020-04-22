class Ingredient

  attr_reader :name, :unit, :calories
  def initialize(information)
    @name = information[:name]
    @unit = information[:unit]
    @calories = information[:calories]
  end

end
