class Recipe < ActiveRecord::Base
    
    has_many :recipe_ingredients, dependent:  :destroy
    has_many :ingredients, through: :recipe_ingredients, :class_name => 'Ingredient'
    
    
    validates :title, presence: true, length: { minimum: 3, maximum: 50}
    
   accepts_nested_attributes_for :recipe_ingredients, :allow_destroy => true
   accepts_nested_attributes_for :ingredients, :reject_if => :all_blank
   

   
   def calculate_cost
    total = 0
    self.recipe_ingredients.each do |recipe_ingredient| 
            cost = (recipe_ingredient.ingredient_price.to_f * recipe_ingredient.quantity.to_f)
            total = total + cost
    end
    self.cost = total
    self.save
   end
  
   

   
end