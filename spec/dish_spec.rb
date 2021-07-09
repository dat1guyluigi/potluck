require 'rspec'
require './lib/dish'

RSpec.describe Dish do

  context 'initialize' do
    dish = Dish.new("Couscous Salad", :appetizer)


    it 'exists with attributes' do
      expect(dish).to be_a(Dish)
      expect(dish.name).to eq("Couscous Salad")
      expect(dish.category).to eq(:appetizer)
    end
  end

end
