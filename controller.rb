require_relative 'model'
require_relative 'view'


class MealMaker
  def initialize
    # DatabaseAccess.new
  end

  def start
    Display.intro
    all_food = DatabaseAccess.get_all_food.flatten
    Display.welcome(all_food)
    option = gets.chomp

    if option == '1'    #burrito
      @burrito_arr = DatabaseAccess.burrito_ingredients
      Display.list_meal_information('Burrito', @burrito_arr)
    elsif option == '2' #burger
      @burger_arr = DatabaseAccess.burger_ingredients
      Display.list_meal_information('Burger', @burger_arr)

    elsif option == '3' #pizza
      @pizza_arr = DatabaseAccess.pizza_ingredients
      Display.list_meal_information('Pizza', @pizza_arr)

    elsif option == '4' #salad
      @salad_arr = DatabaseAccess.salad_ingredients
      Display.list_meal_information('Salad', @salad_arr)

    end

  end

end


meal = MealMaker.new
meal.start


