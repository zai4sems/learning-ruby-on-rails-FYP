class PagesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:about, :home]
    
    def home
        
    end
    
    def dashboard
        @recipes = current_user.recipes
    end
    
    def about
        
    end
    
    def my_recipes
        
    end
    
   
   
end
