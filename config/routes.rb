Rails.application.routes.draw do
  resources :questions

  resources :posts # => creates routes for the CRUD actions see end of CP 34

  get 'about' => 'welcome#about'

  root to: 'welcome#index' # => sets the root or the file that loads when you go to your site/app

end
