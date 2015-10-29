Rails.application.routes.draw do
  get 'sponsored_posts/new'

  get 'sponsored_posts/edit'

  get 'sponsored_posts/show'

  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index' # => sets the root or the file that loads when you go to your site/app

end
