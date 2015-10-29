Rails.application.routes.draw do
  resources :topics do
    resources :posts, except: [:index]
  end

  resources :users, only: [:new, :create]

  get 'about' => 'welcome#about'

  root to: 'welcome#index' # => sets the root or the file that loads when you go to your site/app

end
