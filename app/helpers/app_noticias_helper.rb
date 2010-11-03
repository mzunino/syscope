module AppNoticiasHelper

        # Dado un hash con elementos cargados, devuelve el que corresponda a la ubicación solicitada,
        # y dentro de la ubicación si habiera mas de uno devuelve el también solicitado.
        # Parametros: hash, ubicacion, elemento_dentro de la ubicación
        # Devuelve: un string con el elemento dibujado 
        def mostrarElemento(hash, ubicacion, elemento_vector)

            html_generado = ""
            
            if !hash.nil? && !hash[ubicacion].nil? && !hash[ubicacion][elemento_vector].nil?
                            html_generado += hash[ubicacion][elemento_vector]
            end
          
            return html_generado
        end



      # Obtiene una lista de templates disponibles (tipos de contenidos) y lo lista en un formato que 
      # el usuario pueda seleccionar gráficamente
      def H_app_not_mostrar_templates_disponibles
        
        tipos_disponibles = TipoContenido.find(:all)
        
        @modo_muestra_template = true
        
        html_generado = "<table border=1  > "
        
        tr_templates = "<tr valign=\"top\">"
        for tipo in tipos_disponibles
                    
                    tr_templates += "<td align=\"right\">"
                      tr_templates += tipo.descripcion
                    tr_templates += "</td>"
                    
                    tr_templates += "<td > "
                    tr_templates += render (:partial => tipo.template )
                    tr_templates += "</td>"
                    
        end   
        
        tr_templates += "</tr>"

        
        html_generado += tr_templates
        
        html_generado += "</table>"

         
        
        return html_generado
          
      end
      
end
