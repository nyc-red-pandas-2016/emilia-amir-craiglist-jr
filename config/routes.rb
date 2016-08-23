Rails.application.routes.draw do

  root 'categories#index'

  get '/users/login' => 'users#login'
  post '/users/login' => 'users#loggedin'
  get '/users/logout' => 'users#logout'

  resources :users, only: [:new, :create, :show]
  resources :categories, only: [:index, :show, :destroy, :new, :create] do
    resources :posts
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
