Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users

  # Defines the root path route ("/")
  # root "articles#index"

  resources :blog_posts

  #Ruta raiz
  root "blog_posts#index"
end
