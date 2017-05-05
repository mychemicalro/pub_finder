Rails.application.routes.draw do
  


  get 'password_resets/new'

  get 'password_resets/edit'

  get 'users/new'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'

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
    put :favorite, on: :member
    put :visited, on: :member
  end
  resources :microposts,          only: [:create, :destroy]
  resources :reviews,          only: [:create, :destroy]


end