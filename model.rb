require 'sqlite3'
require_relative 'make_a_meal_database'
require_relative 'meal_data'
$db = SQLite3::Database.open "make-a-meal-database.db"

class DatabaseAccess

  def self.get_all_food
    $db.execute(
      <<-SQL
      select food_item from food;
      SQL
    )
  end

  def self.burrito_ingredients
    $db.execute(
      <<-SQL
      select ingredients.ingredient_name, ingredients.calories from food_ingredients inner join ingredients
      on food_ingredients.food_id = 1 where food_ingredients.ingredient_id = ingredients.id;
      SQL
    )
  end

  def self.burger_ingredients
    $db.execute(
      <<-SQL
      select ingredients.ingredient_name, ingredients.calories from food_ingredients inner join ingredients
      on food_ingredients.food_id = 2 where food_ingredients.ingredient_id = ingredients.id;
      SQL
    )
  end

  def self.pizza_ingredients
    $db.execute(
      <<-SQL
      select ingredients.ingredient_name, ingredients.calories from food_ingredients inner join ingredients
      on food_ingredients.food_id = 3 where food_ingredients.ingredient_id = ingredients.id;
      SQL
    )
  end

  def self.salad_ingredients
    $db.execute(
      <<-SQL
      select ingredients.ingredient_name, ingredients.calories from food_ingredients inner join ingredients
      on food_ingredients.food_id = 4 where food_ingredients.ingredient_id = ingredients.id;
      SQL
    )
  end


  # def self.add(ingredient)
  #   $db.execute(
  #     <<-SQL
  #     insert into meal (ingredient)
  #     values ('#{ingredient}', '#{}');
  #     SQL
  #   )
  # end

  # def self.remove(ingredient)
  #   $db.execute(
  #     <<-SQL
  #     delete from asdf
  #     where asdf == '#{}';
  #     SQL
  #   )
  # end

  # def self.total_calories
  #    $db.execute(
  #     <<-SQL
  #     select sum(MyColumn) as MyColumnSum from MyTable
  #     SQL
  #   )

  # end

  # def self.edit(ingredient)
  #   $db.execute(
  #     <<-SQL
  #     update asdf
  #     set asdf = '#{}', asdf = '#{}'
  #     where asdf == '#{}';
  #     SQL
  #   )
  # end


  # def self.current_meal

  # end
end