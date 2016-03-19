Rails.application.routes.draw do

  resources :labels, only: [:show]

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy] # only adds create & destroy routes for favorites
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  resources :users, only: [:new, :create, :show]

  resources :sessions, only: [:new, :create, :destroy] # => the only: option allows us to generate only certain routes to keep our routing lightweight and avoid unneeded routes

  get 'about' => 'welcome#about'

  root to: 'welcome#index' # => sets the root or the file that loads when you go to your site/app

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update]
      resources :topics, only: [:edit, :new]
    end
  end
end
