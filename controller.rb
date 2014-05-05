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
      Display.choose_ingredients
    elsif option == '2' #burger
      @burger_arr = DatabaseAccess.burger_ingredients
      Display.list_meal_information('Burger', @burger_arr)
      Display.choose_ingredients
    elsif option == '3' #pizza
      @pizza_arr = DatabaseAccess.pizza_ingredients
      Display.list_meal_information('Pizza', @pizza_arr)
      Display.choose_ingredients
    elsif option == '4' #salad
      @salad_arr = DatabaseAccess.salad_ingredients
      Display.list_meal_information('Salad', @salad_arr)
      Display.choose_ingredients
    end

    # ingred_selection = ""
    # until ingred_selection == 'q'
    #   select_ingredients
    select_ingredients

  end

  def select_ingredients
    Display.another_ingredient_selection_msg
    ingred_selection = gets.chomp
    if ingred_selection == 'f'
      Display.goodbye
      exit
    else
      Display.intro
      Display.display_toggled_items(ingred_selection)
    end
    select_ingredients
  end

  def calculate_calories

    Display.total_calorie_display
    calorie_calculator
  end

end


meal = MealMaker.new
meal.start


# def complete(task_number)
#     @list_array[task_number.to_i - 1].gsub!(/(\[ \])/,'[X]')
# end