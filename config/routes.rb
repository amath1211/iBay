Rails.application.routes.draw do
  root 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users do
    resources :items do
      member do
        post 'buy_item'
      end
    end
  end
  get '/all_items', to: 'all_items#index'
  get 'trans', to: 'transactions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
