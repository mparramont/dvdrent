Dvd::Application.routes.draw do
  

  resources :customers
  resources :movies
  
  root "movies#index"

  devise_for :users

  namespace :admin do
    root "base#customers"
    get "movies", to: "base#movies"
    get "customers", to: "base#customers"
    resources :users
    
  end

end
