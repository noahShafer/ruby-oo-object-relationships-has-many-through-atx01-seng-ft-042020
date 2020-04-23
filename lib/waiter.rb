class Waiter
    @@all = []

    attr_accessor :name, :expeirence
    def initialize(name, expeirence)
        @name = name
        @expeirence
        @@all << self
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal|
            meal.waiter.name == self.name
        }
    end

    def best_tipper
        self.meals.sort_by {|meal| meal.tip}.last.customer
    end


    def self.all
        @@all
    end
end