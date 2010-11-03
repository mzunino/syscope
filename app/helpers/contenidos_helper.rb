module ContenidosHelper
  
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style" ] = "display: none"
    end
    content_tag("div" , attributes, &block)
  end
  
  
  # Dada una lista de elementos pertenecientes a un contenido, recupera dependiendo del tipo un 
  # hash con los mismos ya redenrizados.
  # Recibe: elementos
  # Devuelve: @hash_elementos_renderizados
  def H_contenido_cargar_elementos_renderizados( elementos)
    
    # Hash que contiene la lista de elementos dispobibles para mostrar en el template
    @hash_elementos_renderizados = {}
    for @elemento in elementos 
      
      # Voy a buscar el tipo del elemento actual para obtener el renderer que 
      # procederá a dibujarlo
      render_elemento = TipoElemento.find(@elemento.tipo_id).template
      
      # Me fijo si previamente no hay un elemento cargado en la misma ubicacion
      # En caso de ser así se debería rotar entre ellos, de acuerdo a un parametro
      # rotación que funciona como los contenidos
      if @hash_elementos_renderizados[@elemento.ubicacion].nil?
        @hash_elementos_renderizados[@elemento.ubicacion] = Array.new
      end
      
      # Cargo en el vector de elementos que tengo en el Hash para mostrar 
      # en las posiciones estipuladas mas abajo en el código Html
      @hash_elementos_renderizados[@elemento.ubicacion] << render(:partial => render_elemento , :object => @elemento)
      
    end 
    
  end 
  
end