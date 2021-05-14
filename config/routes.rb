Rails.application.routes.draw do
  
  resources :comments
  get 'pages/index'
  get 'pages/about'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  resources :account_executives
  resources :salespeople
  resources :salepeople
  resources :engineers
  resources :sales_stages
  resources :products
  resources :opportunities do
    resources :comments
    resources :support_opportunities
    #get 'search', to: 'opportunities#search', as: 'search', on: :collection
    get 'search', to: 'opportunities#search', on: :collection
  end
  get 'my-top-opps', to: 'opportunities#tracking', as: 'tracking'
  get 'ac-opps', to: 'support_opportunities#acopps', as: 'acopps'
  resources :support_opportunities do
    resources :opportunities
    resources :apple_cares
  end
  resources :apple_cares

  root to: "opportunities#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
