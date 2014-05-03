
require_relative "images"

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
    available_meals.each_with_index do |available_meals, index|
      puts "#{index + 1}  #{available_meals}"
    end
  end

  def self.puts_updated_table(meal_array)
    Art.send(meal)
    counter = 1
    meal_array.each do |food|
      puts counter.to_s.ljust(3) + "[ ] #{food[0].ljust(15)}: #{food[1]}"
      counter +=1
    end
  end

  def self.list_meal_information(meal, meal_array)
    puts meal.upcase
    puts "-"*25
    "Ingredients".rjust(8) + " "*15 + "Calories"
    puts_updated_table(meal_array)
    puts "-"*25
    # puts "Calorie Count" + " "*7 + "#{total_calories}"


  # self.list_meal_information{}

  def self.puts_updated_table(updated_table)
    @updated_table = updated_table
    # counter = 1
    # ingredients_list.each do |ingredient, calories|
    #   puts counter.to_s.ljust(3) + "[ ] #{ingredient.ljust(15)}: #{calories}"
    #   counter += 1
    end
  end

  # self.list_meal_information{}




  def self.choose_ingredients(meal)
    puts "Choose the ingredients for your #{meal} or F to finish."
  end


  def self.delete_ingredient(ingredient)
    puts "You removed #{ingredient}."
  end

  def goodbye
    puts "Happy eating!"
end

meal = "salad"
ingredients = {"lettuce" => 10,  "bacon" => 200, "pickle"=> 10, "onion" =>30}
total_calories = 200


# Display.list_meal_information(meal,ingredients,total_calories)
# Display.choose_ingredients(meal)
Display.intro
Display.list_meal_information(meal)



