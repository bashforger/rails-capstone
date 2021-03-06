Rails.application.routes.draw do
  get 'welcome', to: 'welcome#index'
  resources :transaction_groups
  resources :groups
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :sessions, only: [:new, :create, :destroy]
  scope :sessions do
    get 'signup', to: 'users#new'
    get 'signin', to: 'sessions#new'
    get 'signout', to: 'sessions#destroy'
  end

  resources :users
  resources :transactions
  get 'external_transactions', to: 'transactions#index_external_transactions'

  root to: 'users#home'
end
