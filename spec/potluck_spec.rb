require 'rspec'
require './lib/dish'
require './lib/potluck'

RSpec.describe Potluck do

  context 'initialize' do
    potluck = Potluck.new("7-13-18")
    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)

    it 'exists with attributes' do
      expect(potluck).to be_a(Potluck)
      expect(potluck.date).to eq("7-13-18")
      expect(potluck.dishes).to eq([])
    end

    it 'adds dishes' do
      potluck.add_dish(couscous_salad)
      potluck.add_dish(cocktail_meatballs)

      expect(potluck.dishes).to eq([couscous_salad, cocktail_meatballs])
      expect(potluck.dishes.length).to eq(2)
    end
  end

  context 'iteration 3' do
    potluck = Potluck.new("7-13-18")
    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    summer_pizza = Dish.new("Summer Pizza", :appetizer)
    roast_pork = Dish.new("Roast Pork", :entre)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    candy_salad = Dish.new("Candy Salad", :dessert)

    potluck.add_dish(couscous_salad)
    potluck.add_dish(summer_pizza)
    potluck.add_dish(roast_pork)
    potluck.add_dish(cocktail_meatballs)
    potluck.add_dish(candy_salad)

    it 'gets all from same category with first/name' do
      expect(potluck.get_all_from_category(:appetizer)).to eq([couscous_salad, summer_pizza])
      expect(potluck.get_all_from_category(:appetizer).first).to eq(couscous_salad)
      expect(potluck.get_all_from_category(:appetizer).first.name).to eq("Couscous Salad")
    end
  end

  context 'iteration 4' do
    potluck = Potluck.new("7-13-18")
    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    summer_pizza = Dish.new("Summer Pizza", :appetizer)
    roast_pork = Dish.new("Roast Pork", :entre)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    candy_salad = Dish.new("Candy Salad", :dessert)
    bean_dip = Dish.new("Bean Dip", :appetizer)

    potluck.add_dish(couscous_salad)
    potluck.add_dish(summer_pizza)
    potluck.add_dish(roast_pork)
    potluck.add_dish(cocktail_meatballs)
    potluck.add_dish(candy_salad)
    potluck.add_dish(bean_dip)

    it 'groups with a menu' do
      potluck.menu
      expect(potluck.menu).to eq({ appetizer: [couscous_salad, summer_pizza, bean_dip],
                                   entre: [roast_pork, cocktail_meatballs],
                                   dessert: [candy_salad]})
    end

    it 'gives ratio of dishes by category' do
      expect(potluck.ratio(:appetizer)).to eq(50.0)
    end
  end

end
