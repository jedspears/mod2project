Rails.application.routes.draw do

  get '/', to: 'application#root', as: 'root'
  get '/home', to: 'application#home', as: 'home'
  get '/success', to: 'application#success', as: 'success'
  get '/login', to: 'application#login', as: 'login'
  get '/logout', to: 'application#logout', as: 'logout'
  get '/confirm', to: 'application#confirm', as: 'confirm'

  post '/friendships/create', to: 'friendships#create', as: 'create_friendship'
  get '/friendships', to: 'friendships#index', as: 'friendships'


  get '/bets/new', to: 'bets#new', as: 'new_bet'
  post '/bets/create', to: 'bets#create', as: 'create_bet'
  get '/bets', to: 'bets#index', as: 'bets'
  get '/bets/:id/orange', to: 'bets#orange', as: 'orange_bet'
  get '/bets/:id/delete', to: 'bets#delete', as: 'delete_bet'
  patch '/bets/:id/update', to: 'bets#update', as: 'update_bet'
  get '/bets/:id', to: 'bets#show', as: 'bet'



  get '/bet_requests', to: 'bet_requests#index', as: 'bet_requests'
  get '/bet_requests/new', to: 'bet_requests#new', as: 'new_bet_request'
  post '/bet_requests/create', to: 'bet_requests#create', as: 'create_bet_request'
  get '/bet_requests/:id/respond', to: 'bet_requests#respond', as: 'respond_bet_request'
  patch '/bet_requests/:id/update', to: 'bet_requests#update', as: 'update_bet_request'
  get '/bet_requests/:id/edit', to: 'bet_requests#edit', as: 'edit_bet_request'
  get '/bet_requests/:id/delete', to: 'bet_requests#delete', as: 'delete_bet_request'
  # patch '/bet_requests/:id/response', to: 'bet_requests#response', as: 'response_update_bet_request'
  patch '/bet_requests/:id/bananas', to: 'bet_requests#bananas', as: 'bananas'
  # get '/bet_requests/:id/transfer', to: 'bet_requests#transfer', as: 'transfer'
  get '/bet_requests/:id', to: 'bet_requests#show', as: 'bet_request'

  resources :charges, only: :create
  resources :user_transactions
  resources :bets
  resources :transactions
  resources :friendships, except:[:create, :index]
  resources :users
  resources :user_bet_requests
  # resources :bet_requests
  resources :holding_accounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
