Rails.application.routes.draw do
  resources :topics do
    resources :posts, except: [:index]
    resources :sponsoredposts, except: [:index]
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index' # => sets the root or the file that loads when you go to your site/app

end
