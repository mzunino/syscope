class PrincipalController < ApplicationController
  
  def index

    # Esta es la acción principal que determina que contenidos se deben mostrar
    # en la seccion de aplicación
    # Esta es la aplicación por defecto que se cargará, que será la de novedades
     
    @action_cargar = 'default_app'


    # Se utiliza el render para presentar en la web el resultado de la acción
    render :action => @action_cargar
    
  end

  def default_app

	# El contenido de la aplicacion por defecto será cargado en el 
	# archivo 
  end

private

  def authorize
     unless User.find_by_id(session[:user_id])
	session[:original_uri] = request.request_uri
	flash[:notice] = "Ingresar con un usuario"
	redirect_to(:controller => "admin" , :action => "login" )
     end
  end

end

