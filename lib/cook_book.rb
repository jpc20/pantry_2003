class CookBook

  attr_reader :recipes
  def initialize
    @recipes = []
  end

  def date
    Date.today.strftime(("%m-%d-%Y"))
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    ingredients = []
    @recipes.each do |recipe|
      recipe.ingredients.each do |ingredient|
        ingredients << ingredient.name
      end
    end
    ingredients.uniq
  end

  def highest_calorie_meal
    @recipes.max_by{ |recipe| recipe.total_calories }
  end

end
