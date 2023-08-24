class BlogPostsController < ApplicationController

    #Define un metodo para ser llamado en solo algunas funciones
    #En este caso solo se llama en edit, update, show y destroy
    #Pero no en index, new y create
    #before_action :set_blog_post, only: [:edit, :update, :show, :destory] #Esta es una manera
    before_action :set_blog_post, except: [:index, :new, :create] #Esta es otra manera
    #Nota: En este caso ambas maneras cumplen la misma funcion

    #Funcion index que le asigna todos los valores a la variable @blog_posts
    def index
        #Esta variable de instancia, lo que la hace visible en toda esta clase
        @blog_posts = BlogPost.all
    end
    

    #Funcion show que le asigna todos los valores a la variable @blog_post
    #Emplea el metodo set_blog_post para cargar el elemento con el id al momento de ingresar a esta rute
    def show 
    #Si no se encuentra el elemento en el arreglo entonces redirecciona a la pagina principal

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


    #Funcion para editar un post segun el id recibido por parametos
    #Emplea el metodo set_blog_post para cargar el elemento con el id al momento de ingresar a esta rute
    def edit 
    end


    #Funcion para actualizar un post segun el id recibido por parametos
    def update
        #Emplea el metodo set_blog_post para cargar el elemento con el id al momento de ingresar a esta rute
        #Actualiza el blog, si es exitoso entonces redirecciona a la pagina del post
        if @blog_post.update(blog_post_params)
            redirect_to @blog_post
        else
            #Si no es exitoso entonces renderiza el formulario de nuevo
            render :edit, status: :unprocessable_entity
        end
    end


    #Funcion para eliminar un post segun el id recibido por parametos
    #Emplea el metodo set_blog_post para cargar el elemento con el id al momento de ingresar a esta rute
    def destroy
        #Ejecuta la accion de eliminado
        @blog_post.destroy
        #Redirecciona a la pagina principal
        redirect_to root_path
    end


    #Funcion que valida los parametros que se reciben del formulario
    private 
    def blog_post_params
        #Valida y permite unicamente los parametros title y body
        #Esto en caso de que alguien quiera inyectar codigo malicioso
        params.require(:blog_post).permit(:title, :body)
    end

    #Funcion que busca el post segun el id recibido por parametros
    def set_blog_post
        #Busca el post segun el id recibido por parametros
        @blog_post = BlogPost.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        #Si no lo encuentra entonces redirecciona a la pagina principal
        redirect_to root_path
    end
end