# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def h_custom_periodically_call_remote(formulario_submit, div_actualizar, url_invocar, segundos_intervalo = 20)
      render :text => "<script type=\"text/javascript\">
      //<![CDATA[
      setInterval(function() {
      
      $.ajax({data:$.param($(document.getElementById('#{formulario_submit}')).serializeArray()) + '&amp;authenticity_token=' + encodeURIComponent('D5PxNReOi0sAJWUKWDTRPRj3DKnvZa6NrICKUz3bcMo='), dataType:'script', success:function(request){$('##{div_actualizar}').html(request);}, type:'post', url:'#{url_invocar}'});
      
      }, #{segundos_intervalo} * 1000)
      //]]>
      
      </script>"
  end

end
