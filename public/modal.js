$(document).ready(function(){
        //parametros principales
        
//        var contenidoHTML = "<div class=\"contenido\><fieldset><legend><%= @noticia.descripcion %></legend><hr /><%= mostrarElemento(hashElementosUbicacion, 1,0)  %><%= mostrarElemento(hashElementosUbicacion, 2,0)  %><hr /> </fieldset></div>"

	var contenidoHTML = "HOLA"
        var ancho = 600;
        var alto = 250;

        $('#button').click(function(){
                // fondo transparente
                // creamos un div nuevo, con dos atributos
                var bgdiv = $('<div>').attr({
                                        className: 'bgtransparent',
                                        id: 'bgtransparent'
                                        });
                
                // agregamos nuevo div a la pagina
                $('body').append(bgdiv);
                
                // obtenemos ancho y alto de la ventana del explorer
                var wscr = $(window).width();
                var hscr = $(window).height();
                
                //establecemos las dimensiones del fondo
                $('#bgtransparent').css("width", wscr);
                $('#bgtransparent').css("height", hscr);
                
                
                // ventana modal
                // creamos otro div para la ventana modal y dos atributos
                var moddiv = $('<div>').attr({
                                        className: 'bgmodal',
                                        id: 'bgmodal'
                                        });
                
                // agregamos div a la pagina
                $('body').append(moddiv);

                // agregamos contenido HTML a la ventana modal
                $('#bgmodal').append(contenidoHTML);
                
                // redimensionamos para que se ajuste al centro y mas
                $(window).resize();
        });

        $(window).resize(function(){
                // dimensiones de la ventana del explorer
                var wscr = $(window).width();
                var hscr = $(window).height();

                // estableciendo dimensiones de fondo
                $('#bgtransparent').css("width", wscr);
                $('#bgtransparent').css("height", hscr);
                
                // estableciendo tamaño de la ventana modal
                $('#bgmodal').css("width", ancho+'px');
                $('#bgmodal').css("height", alto+'px');
                
                // obtiendo tamaño de la ventana modal
                var wcnt = $('#bgmodal').width();
                var hcnt = $('#bgmodal').height();
                
                // obtener posicion central
                var mleft = ( wscr - wcnt ) / 2;
                var mtop = ( hscr - hcnt ) / 2;
                
                // estableciendo ventana modal en el centro
                $('#bgmodal').css("left", mleft+'px');
                $('#bgmodal').css("top", mtop+'px');
        });
        
 });
        
function closeModal(){
        // removemos divs creados
        $('#bgmodal').remove();
        $('#bgtransparent').remove();
}
