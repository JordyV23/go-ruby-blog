class BlogPostsController < ApplicationController

    #Funcion index que le asigna todos los valores a la variable @blog_posts
    def index
        #Esta variable de instancia, lo que la hace visible en toda esta clase
        @blog_posts = BlogPost.all
    end

    #Funcion show que le asigna todos los valores a la variable @blog_post
    def show 
        #Busca en la base de datos un elemento con el parametro id de la URL 
        @blog_post = BlogPost.find(params[:id])
    #Si no se encuentra el elemento en el arreglo entonces redirecciona a la pagina principal
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end

    #Funcion renderiza el formulario para agregar un post nuevo
    def new 
        #Crea un nuevo blog en memoria pero no lo guarda en DB
        @blog_post = BlogPost.new
    end

    #Funcion para crear un nuevo post en la base de datos
    def create
        #Crea el post
        @blog_post = BlogPost.new(blog_post_params)

        #Si el guardado es exitoso entonces redirecciona a la pagina de los posts
        if @blog_post.save
            redirect_to @blog_post
        else
        #Si no es exitoso entonces renderiza el formulario de nuevo
            render :new, status: :unprocessable_entity
        end
    end

    #Funcion que valida los parametros que se reciben del formulario
    private 
    def blog_post_params
        #Valida y permite unicamente los parametros title y body
        #Esto en caso de que alguien quiera inyectar codigo malicioso
        params.require(:blog_post).permit(:title, :body)
    end
end