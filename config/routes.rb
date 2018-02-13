Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  
  get '/profile/:id' => "home#profile"

  post '/tweet' => "home#tweet"
  post '/like' => "home#like"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
