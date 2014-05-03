require 'sqlite3'
require 'debugger'
require_relative 'make_a_meal_database'
$db = SQLite3::Database.open "make-a-meal-database.db"

class Food
  def create(food_item)
    $db.execute(
      <<-SQL
      insert into food (food_item)
      values ('#{food_item}');
      SQL
    )
  end
end

class Ingredients
  def create(ingredient_name, calorie)
    $db.execute(
      <<-SQL
      insert into ingredients (ingredient_name, calories)
      values ('#{ingredient_name}', '#{calorie}');
      SQL
    )
  end
end

class FoodIngredients
    def create(food_id, ingredient_id)
    $db.execute(
      <<-SQL
      insert into food_ingredients (food_id, ingredient_id)
      values ("#{food_id}", "#{ingredient_id}");
      SQL
    )
  end
end

food_item = Food.new
ingredient_cals = Ingredients.new
food_ingre = FoodIngredients.new
#creating the table for item
foods = ["burrito", "burger", "pizza", "salad"]
foods.each do |item| food_item.create(item) end

#creating the ingredients

ingre_cal = {
  lettuce: 20,
  tomatoes: 40,
  pickles: 20,
  onions: 40,
  turkey_patty: 180,
  beef_patty: 245,
  veggie_patty: 100,
  cheese: 225,
  olive: 15,
  sausage: 45,
  pepperonni: 70,
  mushrooms: 40,
  peppers: 15,
  chicken_strip: 140,
  ham: 203,
  pineapple: 75,
  arugula: 20,
  cucumbers: 5,
  croutons: 122,
  carrots: 45,
  brown_rice: 230,
  white_rice: 225,
  pinto_beans: 265,
  black_beans: 225,
  corn: 60,
  chicken: 140,
  beef: 150,
  pork: 165
}

ingre_cal.each{ |ingredient, calories| ingredient_cals.create(ingredient.to_s, calories)}

#food to ingredient_calories
food_to_ingredient = {
  1 => [21, 23, 24, 25, 26, 27, 28, 8, 1, 13],
  2 => [1, 2, 3, 4, 5, 6, 7, 8],
  3 => [8, 9, 10, 11, 12, 13, 14, 15, 16, 2, 17, 4],
  4 => [1, 2, 3, 4, 8, 9, 10, 11, 12, 13, 14, 15, 17, 18, 19, 20, 25, 27]
}

food_to_ingredient.each do |food_id, ingredient_array|
  ingredient_array.each do |ingredient_id|
    food_ingre.create(food_id, ingredient_id)
  end
end
