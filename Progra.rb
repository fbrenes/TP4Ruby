#/______________________________________________________/
#/ Instituto Tecnologico de Costa Rica                  /
#/ Lenguajes de programacion                            /
#/ Tarea programada 4          2012                     /
#/ Frank Brenes, Mercedes Escalante, Yader Morales      /
#/______________________________________________________/


require 'sinatra'  # Se especifican las gemas de ruby que se usarán
require 'erb'
require 'flickraw'
require 'rubygems';


$lista = []
$cantidad_resultados = 10
$Pagina=0
$error = false

FlickRaw.api_key='caee413426372bd72aac3dfea3dd037a'
FlickRaw.shared_secret='54073bafec5e0586'

class BusquedaFlickr 
			#Variables necesarias 
		@Titulo
		@Nombre_usuario
		@Url
		@Urls
		
		attr_reader :Titulo, :Nombre_usuario, :Url, :Urls
		attr_writer :Titulo, :Nombre_usuario, :Url, :Urls

	def initialize(titulo, usuario, url, urls) # Constructor de la clase inicializa las variables
		@Titulo = titulo
		@Nombre_usuario = usuario
		@Url = url
		@Urls = urls	
	end
	
end
	
	

	
	def informacion (tag, num) # Funcion que se encarga de asignar los resultados de la busqueda en una lista
	busqueda_fotos = flickr.photos.search(:tags =>tag, :per_page => num, :page => 1)  # Se conecta con el servicio de Flickr
	contador =0
		while contador != busqueda_fotos.length
			info = flickr.photos.getInfo(:photo_id => busqueda_fotos[contador].id)
			resultados = BusquedaFlickr.new(info.title, info.owner.username, FlickRaw.url_b(info), FlickRaw.url_photopage(info)) # asigna a cada uno de los resultados de la busqueda los atributos de la clase
			
			$lista += [resultados] #Crea una lista con los obejtos, cada objeto esta compuesto por la informacion de una foto
			contador +=1 # contador que avanza en la lista de resultados 
		end
		
		
		begin
			puts $lista[$Pagina].Url
		rescue  Exception=>e   #en caso de haber un error redirecciona a la siguiente pagina
			redirect "/error"
		end
		mostrar(num) #llamada a la funcion que se encarga de asignar las variables para mostrarlas en la pagina web
	end
		
	def mostrar (num)     # Método que coloca y muestra las imagenés en sus contenedores respectivos  en el erb
		if num == 5
			$img1 = $lista[$Pagina].Url 			# Asignacion a cada variable la determinada posicion de la lista
			$tit1 = $lista[$Pagina].Titulo
			$aut1 = $lista[$Pagina].Nombre_usuario
			$Pagina+=1
			
			$img2 = $lista[$Pagina].Url
			$tit2 = $lista[$Pagina].Titulo
			$aut2 = $lista[$Pagina].Nombre_usuario
			$Pagina+=1
			
			$img3 = $lista[$Pagina].Url
			$tit3 = $lista[$Pagina].Titulo
			$aut3 = $lista[$Pagina].Nombre_usuario
			$Pagina+=1
			
			$img4 = $lista[$Pagina].Url
			$tit4 = $lista[$Pagina].Titulo
			$aut4 = $lista[$Pagina].Nombre_usuario
			$Pagina+=1
			
			$img5 = $lista[$Pagina].Url
			$tit5 = $lista[$Pagina].Titulo
			$aut5 = $lista[$Pagina].Nombre_usuario
			$Pagina+=1
			
			$img6 = ""
			$tit6 = ""
			$aut6 = ""
			
		elsif num == 4
			$img1 = $lista[$Pagina].Url
			$tit1 = $lista[$Pagina].Titulo
			$aut1 = $lista[$Pagina].Nombre_usuario
			$Pagina+=1
			
			$img2 = $lista[$Pagina].Url
			$tit2 = $lista[$Pagina].Titulo
			$aut2 = $lista[$Pagina].Nombre_usuario
			$Pagina+=1
			
			$img3 = $lista[$Pagina].Url
			$tit3 = $lista[$Pagina].Titulo
			$aut3 = $lista[$Pagina].Nombre_usuario
			$Pagina+=1
			
			$img4 = $lista[$Pagina].Url
			$tit4 = $lista[$Pagina].Titulo
			$aut4 = $lista[$Pagina].Nombre_usuario
			$Pagina+=1
			
			$img5 = ""
			$tit5 = ""
			$aut5 = ""
			
			$img6 = ""
			$tit6 = ""
			$aut6 = ""
			
		elsif num == 3
			$img1 = $lista[$Pagina].Url
			$tit1 = $lista[$Pagina].Titulo
			$aut1 = $lista[$Pagina].Nombre_usuario
			$Pagina+=1
			
			$img2 = $lista[$Pagina].Url
			$tit2 = $lista[$Pagina].Titulo
			$aut2 = $lista[$Pagina].Nombre_usuario
			$Pagina+=1
			
			$img3 = $lista[$Pagina].Url
			$tit3 = $lista[$Pagina].Titulo
			$aut3 = $lista[$Pagina].Nombre_usuario
			$Pagina+=1
			
			$img4 = ""
			$tit4 = ""
			$aut4 = ""
			
			$img5 = ""
			$tit5 = ""
			$aut5 = ""
			
			$img6 = ""
			$tit6 = ""
			$aut6 = ""
			
		elsif num == 2
			$img1 = $lista[$Pagina].Url
			$tit1 = $lista[$Pagina].Titulo
			$aut1 = $lista[$Pagina].Nombre_usuario
			$Pagina+=1
			
			$img2 = $lista[$Pagina].Url
			$tit2 = $lista[$Pagina].Titulo
			$aut2 = $lista[$Pagina].Nombre_usuario
			$Pagina+=1
			
			$img3 = ""
			$tit3 = ""
			$aut3 = ""
			
			$img4 = ""
			$tit4 = ""
			$aut4 = ""
			
			$img5 = ""
			$tit5 = ""
			$aut5 = ""
			
			$img6 = ""
			$tit6 = ""
			$aut6 = ""
		 elsif num == 1
			$img1 = $lista[0].Url
			$tit1 = $lista[0].Titulo
			$aut1 = $lista[0].Nombre_usuario
			$Pagina+=1
			
			$img2 = ""
			$tit2 = ""
			$aut2 = ""
			
			$img3 = ""
			$tit3 = ""
			$aut3 = ""
			
			$img4 = ""
			$tit4 = ""
			$aut4 = ""
			
			$img5 = ""
			$tit5 = ""
			$aut5 = ""
			
			$img6 = ""
			$tit6 = ""
			$aut6 = ""
	else
		
		
		$img1 = $lista[$Pagina].Url
		$tit1 = $lista[$Pagina].Titulo
		$aut1 = $lista[$Pagina].Nombre_usuario
		$Pagina+=1
		
		$img2 = $lista[$Pagina].Url
		$tit2 = $lista[$Pagina].Titulo
		$aut2 = $lista[$Pagina].Nombre_usuario
		$Pagina+=1
		
		$img3 = $lista[$Pagina].Url
		$tit3 = $lista[$Pagina].Titulo
		$aut3 = $lista[$Pagina].Nombre_usuario
		$Pagina+=1
		
		$img4 = $lista[$Pagina].Url
		$tit4 = $lista[$Pagina].Titulo
		$aut4 = $lista[$Pagina].Nombre_usuario
		$Pagina+=1
		
		$img5 = $lista[$Pagina].Url
		$tit5 = $lista[$Pagina].Titulo
		$aut5 = $lista[$Pagina].Nombre_usuario
		$Pagina+=1
		
		$img6 = $lista[$Pagina].Url
		$tit6 = $lista[$Pagina].Titulo
		$aut6 = $lista[$Pagina].Nombre_usuario
		$Pagina+=1
		
	end
end

get '/error' do   # Método que carga la pag de Error
  erb :'500'
end

get '/' do            # Método que carga la pag de inicio y busqueda de imágenes
	erb :Interfaz
end
	
post '/' do            # Método que carga la pag de inicio y busqueda de imágenes
	erb :Interfaz
end

post '/resultados' do  # Método que llama a la funciones que realiza la busqueda de imagenes y redirecciona a la pag de resultados.
	$lista = []
	$Pagina = 0
	tag = params[:campo].to_s
	num = params[:numeros].to_i
	informacion(tag, num)
	redirect '/resultado'
	
	
	
end

get '/resultado' do   # Método que redirecciona a la pag de resultados en donde se muestran las imagenes.
	erb :Resultado
	
end


post '/siguiente2' do   # Método que se encarga de mostrar las imagenes restantes en la siguiente pag segun la busqueda.

	if ($Pagina  <= 6)
		puts "Ya se han desplegado los resultados"
	end

	if ($Pagina <= ($lista.length)-1)	
		$img1 = $lista[$Pagina].Url
		$tit1 = $lista[$Pagina].Titulo
		$aut1 = $lista[$Pagina].Nombre_usuario
		$Pagina +=1
	else 
		$img1 = ""
		$tit1 = ""
		$aut1 = ""
	end

	if ($Pagina <= ($lista.length)-1)
		$img2 = $lista[$Pagina].Url
		$tit2 = $lista[$Pagina].Titulo
		$aut2 = $lista[$Pagina].Nombre_usuario
		$Pagina +=1
	else 
		$img2 = ""
		$tit2 = ""
		$aut2 = ""
	end

	if ($Pagina <= ($lista.length)-1)	
		$img3 = $lista[$Pagina].Url
		$tit3 = $lista[$Pagina].Titulo
		$aut3 = $lista[$Pagina].Nombre_usuario
		$Pagina +=1
	else 
		$img3 = ""
		$tit3 = ""
		$aut3 = ""
	end

	if ($Pagina <= ($lista.length)-1)
		$img4 = $lista[$Pagina].Url
		$tit4 = $lista[$Pagina].Titulo
		$aut4 = $lista[$Pagina].Nombre_usuario
		$Pagina +=1
	else 
		$img4 = ""
		$tit4 = ""
		$aut4 = ""
	end

	if ($Pagina <= ($lista.length)-1)
		$img5 = $lista[$Pagina].Url
		$tit5 = $lista[$Pagina].Titulo
		$aut5 = $lista[$Pagina].Nombre_usuario
		$Pagina +=1
	else 
		$img5 = ""
		$tit5 = ""
		$aut5 = ""
	end

	if ($Pagina <= ($lista.length)-1)
		$img6 = $lista[$Pagina].Url
		$tit6 = $lista[$Pagina].Titulo
		$aut6 = $lista[$Pagina].Nombre_usuario
		$Pagina +=1
	else 
		$img6 = ""
		$tit6 = ""
		$aut6 = ""
	end

	redirect '/resultado'

end

post '/anterior' do        # Método que se encargar de mostrar las imagenes anteriores segun la busqueda hecha.

	if ($Pagina <= 6)
	puts "Error, no se puede devolver"

	else 	

	$Pagina+=-7
	$img6 = $lista[$Pagina].Url
	$tit6 = $lista[$Pagina].Titulo
	$aut6 = $lista[$Pagina].Nombre_usuario		

	$Pagina+=-1		
	$img5 = $lista[$Pagina].Url
	$tit5 = $lista[$Pagina].Titulo
	$aut5 = $lista[$Pagina].Nombre_usuario	

	$Pagina+=-1		
	$img4 = $lista[$Pagina].Url
	$tit4 = $lista[$Pagina].Titulo
	$aut4 = $lista[$Pagina].Nombre_usuario	

	$Pagina+=-1		
	$img3 = $lista[$Pagina].Url
	$tit3 = $lista[$Pagina].Titulo
	$aut3 = $lista[$Pagina].Nombre_usuario	

	$Pagina+=-1		
	$img2 = $lista[$Pagina].Url
	$tit2 = $lista[$Pagina].Titulo
	$aut2 = $lista[$Pagina].Nombre_usuario	

	$Pagina+=-1		
	$img1 = $lista[$Pagina].Url
	$tit1 = $lista[$Pagina].Titulo
	$aut1 = $lista[$Pagina].Nombre_usuario	
		
	end	
	
	redirect '/resultado'

end
