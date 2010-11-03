class AdminController < ApplicationController
  def login
	if session[:user_id].nil?

		if request.post?
		  user = User.authenticate(params[:name], params[:password])
	
		  if user
		  	logger.error("Se encontro el usuario: #{user.name}")
			logger.debug("Como se encontró el usuario se crea la session")
			session[:user_id] = user.id
			session[:profile_id] = user.profile_id

			uri = session[:original_uri]
			session[:original_uri] = nil
			redirect_to(uri || { :controller => "app_noticias" })
		  else
		    flash.now[:notice] = "Usuario o password incorrecto"
		  end
		end
	else
                    redirect_to( :controller => "app_noticias" )
		    flash.now[:notice] = "Ya se encuentra logueado en el sistema con el usuario: #{session[:user_id]}"

	end
  end

  def logout
	session[:user_id] = nil
	session[:profile_id] = nil
	flash[:notice] = "Ha salido del sistema<br />Para volver a ver sus preferencias debe ingresar nuevamente al sistema utilizando Login<br />Hasta la próxima!!!"
	redirect_to(:controller => "principal")
  end

  def index
	#@total_orders = Order.count
  end

end
