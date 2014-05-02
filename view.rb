

class Display

  def self.intro
    self.clear_screen
    self.move_to_home
  end

  def self.clear_screen
    print "\e[2J"
  end

  def self.move_to_home
    print "\e[H"
  end

  def self.welcome(available_meals)
    puts "Welcome to Make a Meal! \nWhat would you like to make?"
    meals.each_with_index do |available_meals, index|
      puts "#{index + 1}  #{meal}"
    end
  end

  def self.list_meal_information(meal, ingredients_list, total_calories)
    puts meal.upcase
    puts "-"*25
    "Ingredients".rjust(8) + " "*15 + "Calories"
    yield ###### for self.puts_updated_table check for send - expecting updated table from controller ######
    puts "-"*25
    puts "Calorie Count" + " "*7 + "#{total_calories}"
  end

  self.list_meal_information{}



  def self.puts_updated_table(updated_table)
    puts updated_table
    # counter = 1
    # ingredients_list.each do |ingredient, calories|
    #   puts counter.to_s.ljust(3) + "[ ] #{ingredient.ljust(15)}: #{calories}"
    #   counter += 1
    end
  end


  def self.choose_ingredients(meal)
    puts " Choose the ingredients for your #{meal} of "F" to finish."

  end


end

meal = "burger"
ingredients = {"lettuce" => 10,  "bacon" => 200, "pickle"=> 10, "onion" =>30}
total_calories = 200

Display.list_meal_information(meal,ingredients,total_calories)
Display.choose_ingredients(meal)


