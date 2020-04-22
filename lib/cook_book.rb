class CookBook

  attr_reader :recipes
  def initialize
    @recipes = []
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

end
