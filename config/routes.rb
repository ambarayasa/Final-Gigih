Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :categories
      resources :menus
      resources :orders
      get '/reports', to: 'reports#report'
      patch '/orders/:id/canceled', to: 'orders#canceled'
      patch '/orders/:id/paid', to: 'orders#paid'
      
    end
  end
  
  resources :categories
  resources :menus
  resources :orders
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
