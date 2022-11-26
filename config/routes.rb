Rails.application.routes.draw do
  resources :groups do 
    resources :subjects
  end

  resources :splash, only: %i[index]
  devise_for :users, sign_out_via: %i[get]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "splash#index"
end
