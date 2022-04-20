Rails.application.routes.draw do
  # get 'categories/index'
  # get 'categories/new'
  # get 'categories/edit'
  # get 'categories/show'
  # get 'menus/index'
  # get 'menus/new'
  # get 'menus/edit'
  # get 'menus/show'
  resources :categories
  resources :menus
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
