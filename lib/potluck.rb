
class Potluck
  attr_reader :date, :dishes

  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def length
    @dishes.count
  end

  def get_all_from_category(category)
    @dishes.find_all do |dish|
      dish.category == category
    end
  end

  def menu
    @dishes.group_by { |dish| dish.category }
  end

  def ratio(category)
    (get_all_from_category(category).length.to_f / @dishes.length) * 100
  end

end
