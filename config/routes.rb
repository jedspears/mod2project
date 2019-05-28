Rails.application.routes.draw do
  resources :user_transactions
  resources :bets
  resources :transactions
  resources :friendships
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
