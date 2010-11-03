# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  
  layout :obtener_layout_aplicacion


# before_filter :authorize, :except => :login
  
  helper :all # include all helpers, all the time
  #protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  session :session_key => '_depot_session_id'
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery :secret => '8c3e099237e6366fd2f5366e9c430e79'

  
  def cargar_menu_usuario
        # Carga el menu dependiendo del usuario logueado en el sistema
        @menu = "menu_common"
        if @user
                @perfil = @user.profile_id
                if @perfil == 1
                        @menu = 'menu_usuario'
                elsif @perfil == 2
                        @menu = 'menu_admin'
                end
        end
        return 'principal/' + @menu
  end



private

  def obtener_layout_aplicacion

    layout = "********  Obteniendo el layout de la aplicación"

    # Check if logged in, because current_user could be nil.
    logger.debug("********  Usuario cargado:  #{@usuario_logueado}")


    if session[:user_id].nil?  
	
	logger.debug("********  No hay usuario cargado en el sistema " )
   	
	# Si no hay usuario logueado se muestra el layout comun a todas las aplicaciones 
    	layout = "principal_common"


    else

	@user = User.find(session[:user_id])	

	# Se obtiene el layout correspondiente al perfil del usuario logueado
	logger.debug("********  Id profile: " + @user.name)

	@profile_usuario = Profile.find_by_id(@user.profile_id)
	if @profile_usuario

		logger.debug("********  Perfil del usuario cargado con perfil: ") # + @profile_usuario.name + " con template: " + @profile_usuario.templa)
		@container = Container.find(@profile_usuario.container_id)
		
		logger.debug("El template asignado para el perfil es: " + @container.template)
		layout = @container.template
	else
		layout = "no_conozco"
	end
    end

    return layout 
  end


def method_missing( id, *argumentos )
  puts "El método #{id} fue invocado, pero no existe. Tiene " + 
       "estos argumentos: #{argumentos.join(", ")}"
end

protected
  def authorize
    unless User.find_by_id(session[:user_id])
      flash[:notice] = "Please log in"
      redirect_to :controller => :admin, :action => :login
    end
  end





end
