# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
    def fckeditor_text_field(object, method, options = {})
      javascript_tag( "var oFCKeditor = new FCKeditor('" + object + "_" + method + "',300,300,'Basic2');oFCKeditor.ReplaceTextarea()" )
    end

          def h_helper_prueba()
          
#            render :text => "Resultado renderizado..."
#            texto = AppNoticiasController.prueba_call_remote
#            logger.debug("Este es el contenido de texto: #{texto}")
#            return texto
             texto = render :controller => "app_noticias", :action => "prueba_call_remote"
             logger.debug("Este es el contenido de texto: #{texto}")
            
        end
end
