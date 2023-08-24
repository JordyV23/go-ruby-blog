Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #Crea una ruta tipo get para ingresar datos del nuevo post
  #Tiene el alias "new_blog_posts"
  get "/blog_posts/new", to: "blog_posts#new", as: :new_blog_post

  #Crea una ruta tipo post para crear un nuevo post
  #Tiene el alias "blog_posts"
  post "/blog_posts", to: "blog_posts#create", as: :blog_posts


  #Crea una ruta tipo get que recibe un parametro llamado id
  #Tiene el id para editar el post
  #Tiene el alias "edit_blog_posts"
  get "/blog_posts/:id/edit", to: "blog_posts#edit", as: :edit_blog_post

  #Crea una ruta tipo patch que recibe un parametro llamado id
  #Tiene el id para actualizar el post
  patch "/blog_posts/:id", to: "blog_posts#update"


  #Crea una ruta tipo get que recibe un parametro llamado id
  #Obtiene el post con el id que se le pasa
  #Tiene el alias "blog_posts"
  get "/blog_posts/:id", to: "blog_posts#show", as: :blog_post

  root "blog_posts#index"
end
