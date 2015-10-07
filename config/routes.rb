Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about'

  root to: 'welcome#index' # => sets the root or the file that loads when you go to your site/app

end
