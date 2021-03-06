Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => "user/registrations" }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  
  devise_scope :user do
    authenticated :user do
      root :to => 'pages#dashboard', as: :authenticated_root
    end
    
    
    
    unauthenticated :user do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  
  root 'devise/sessions#new'
  #root 'pages#dashboard'
  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'all_users', to: 'pages#all_users'
  get 'my_recipes', to: "recipes#my_recipes"
  get 'search_ingredients', to: "ingredients#search"
  get 'search_materials', to: "materials#search"
  
  get "recipe/new_release" => 'recipe#new_release', :as => :new_release
  
  resources :ingredients
  
  resources :recipes
    
  resources :recipe_ingredients

  resources :overheads
  
  resources :materials
  
  resources :recipe_materials
  
  resources :users#, only: [:index, :edit, :update]

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
