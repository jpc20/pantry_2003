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


  def summary
    @recipes.map do |recipe|
      {
        name: recipe.name,
        details:
        {
          ingredients: ingredients_arr_of_hashes(recipe),
          total_calories: recipe.total_calories
        }
      }
    end
  end

  def ingredients_arr_of_hashes(recipe)
    recipe.ingredients.sort_by do |ingredient|
      -(recipe.ingredients_required[ingredient] * ingredient.calories)
    end.map do |ingredient|
      {
        ingredient: ingredient.name,
        amount: recipe.ingredients_required[ingredient].to_s + " " + ingredient.unit
      }
    end
  end

end
