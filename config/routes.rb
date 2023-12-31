Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1, path: '/' do
      resources :blog_posts, path: '/articles'
      resources :users
    end
  end
  
  # Defines the root path route ("/")
  # root "articles#index"
end
