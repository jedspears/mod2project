Rails.application.routes.draw do
  resources :holding_accounts
  get '/', to: 'application#root', as: 'root'
  get '/home', to: 'application#home', as: 'home'
  get '/success', to: 'application#success', as: 'success'
  post '/friendships/create', to: 'friendships#create', as: 'create_friendship'
  get '/friendships', to: 'friendships#index', as: 'friendships'
  get '/bets/new', to: 'bets#new', as: 'new_bet'
  post '/bets/create', to: 'bets#create', as: 'create_bet'
  resources :user_transactions
  resources :bets
  resources :transactions
  resources :friendships, except:[:create, :index]
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
