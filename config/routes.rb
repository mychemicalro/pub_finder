Rails.application.routes.draw do
  


  get 'password_resets/new'

  get 'password_resets/edit'

  get 'users/new'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'

  get  '/signup',  to: 'users#new'
  get  '/new_pub', to: 'pubs#new'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'


  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :pubs do
    resources :microposts
    resources :reviews
    resources :menus
    put :favorite, on: :member
    put :visited, on: :member
    member do
      get :validatee
    end 
  end
  resources :microposts,          only: [:create, :destroy, :edit, :update]
  resources :reviews do
    resources :answers
  end

  resources :answers

	




end
