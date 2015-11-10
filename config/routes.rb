Rails.application.routes.draw do

  resources :labels, only: [:show]

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy] # => the only: option allows us to generate only certain routes to keep our routing lightweight and avoid unneeded routes

  get 'about' => 'welcome#about'

  root to: 'welcome#index' # => sets the root or the file that loads when you go to your site/app

end
