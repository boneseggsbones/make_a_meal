
require_relative "images"
@@calories = 0
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
    Art.welcome
    puts "Welcome to Make a Meal! \nWhat would you like to make?"
    available_meals.each_with_index do |available_meals, index|
      puts "#{index + 1}  #{available_meals}"
    end
  end

  def self.puts_updated_table(meal, meal_array)
    Art.send(meal.downcase)
    counter = 1
    @meal_arr = []
    meal_array.each do |food|
      # puts counter.to_s.ljust(3) + "[ ] #{food[0].ljust(15)}: #{food[1]}"

      @meal_arr << counter.to_s.ljust(3) + "[ ] #{food[0].ljust(15)}: #{food[1]}"
      counter +=1
    end
    @meal_arr.each {|line| puts line}
  end

  def self.list_meal_information(meal, meal_array)
    puts meal.upcase
    puts "-"*35
    "Ingredients".rjust(8) + " "*15 + "Calories"
    puts_updated_table(meal, meal_array)
    puts "-"*35
    # calories = []
    # meal_array.each do |food|
    #   food[1]
    # puts "Calorie Count" + " "*7 + "#{total_calories}"
  end

  # self.list_meal_information{}

  def self.another_ingredient_selection_msg
    print "Make another selection:  "
  end



  def self.choose_ingredients
    print "Choose the ingredients for your meal or f to finish."
  end

  def self.goodbye
    puts "Happy eating!"
  end

  def self.display_toggled_items(selection)

    index = selection.to_i - 1
    @meal_arr[index].match(/(\[ \])/)[0] == "[ ]"
    @meal_arr[index].gsub!(/(\[ \])/,'[X]')
    @meal_arr.each {|line| puts line}
    @@calories += @meal_arr[index].match(/( \d+)/)[0].to_i
    puts "-"*35
    if @@calories > 1000
      puts "Calorie Count" + " "*10 + "#{@@calories}"
      puts "Fatass...."
      puts "-"*35
    else
      puts "Calorie Count" + " "*10 + "#{@@calories}"
    end
  end

  def self.total_calorie_display
    print "Total calories: "
  end
end

# meal = "salad"
# ingredients = {"lettuce" => 10,  "bacon" => 200, "pickle"=> 10, "onion" =>30}
# total_calories = 200


# Display.list_meal_information(meal,ingredients,total_calories)
# Display.choose_ingredients(meal)
# Display.intro
# Display.list_meal_information(meal)



