CarrierWaveExample::Application.routes.draw do

  resources :resumes, only: [:index, :new, :create, :destroy]
  resources :administradors, only: [:index, :new, :create, :destroy]
  resources :tratamientos, only: [:index, :new, :create, :destroy]
  resources :equipos, only: [:index, :new, :create, :destroy]

  get 'preguntas_frecuentes/listar'

  get 'preguntas_frecuentes/nuevo'

  get 'preguntas_frecuentes/datos'

  get 'preguntas_frecuentes/eliminar'

  get 'app_principal/index'

  get 'app_principal/login'

  get 'app_principal/logout'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'app_principal#index'

  get 'admin/login' => 'app_principal#login'

  get 'login' => 'app_principal#loginusr'
  get 'logout' => 'app_principal#paclogout'
  post 'login' => 'app_principal#loginusrPOST'

  post 'admin/loguear' => 'app_principal#loguear'

  get 'quienessomos' => 'app_principal#quienes_somos'

  get 'equiposinfo' => 'app_principal#instalaciones'

  get 'tratamientosinfo' => 'app_principal#tratamiento'

  get 'noticias' => 'app_principal#noticias'

  get 'vernoticia/:id' => 'app_principal#noticia_individual'

  get 'admin/citas' => 'cita#gestionar'
  get 'cita' => 'app_principal#cita'


  get 'comollegar' => 'app_principal#comollegar'

  get 'pfrecuentes' => 'app_principal#pfrecuentes'

  get 'registro' => 'app_principal#registro'
  post 'registro' => 'app_principal#registroPOST'


  get 'admin' => 'admin#panel'


  get 'paciente/nuevo' => 'paciente#nuevo'

  post 'paciente/registrar' => 'paciente#registrar'

  get 'paciente/verificar' => 'paciente#verificar_paciente'

  get 'paciente/listar' => 'paciente#listar_paciente'
  get 'paciente/listar/:query/:criterio' => 'paciente#listar_paciente'

  get 'paciente/:id/editar' => 'paciente#editar'
  post 'paciente/:id/editar' => 'paciente#editarPOST'


  get 'paciente/:id/historial' => 'historial#todo'

  get 'paciente/:id/historial/nuevo' => 'historial#nuevo'
  post 'paciente/:id/historial/nuevo' => 'historial#nuevoPOST'

  get 'historial/revisar' => 'historial#revisar'

  get 'historial/:id/editar' => 'historial#editar'
  post 'historial/:id/editar' => 'historial#editarPOST'

  post 'historial/eliminar' => 'historial#eliminar'

  post 'recuperarpass/:email' => 'app_principal#recuperarpass'


  get 'authtoken/:idusr/:token' => 'app_principal#verificartoken'
  post 'reestablecerpass/:idusr/:token' => 'app_principal#reestablecerpass'


  get 'citas/gestionar' => 'cita#gestionar'
  get 'cita/hora' => 'cita#hora'
  get 'cita/horausr' => 'cita#horausr'
  get 'cita/verificarpac' => 'cita#verificar'
  post 'cita/nuevo' => 'cita#nuevo'
  post 'cita/nuevo/usr' => 'cita#nuevousr'
  post 'cita/editar' => 'cita#editar'
  get 'cita/datos' => 'cita#datos'


  get 'pfrecuentes/gestionar' => 'preguntas_frecuentes#listar'
  post 'pfrecuentes/eliminar' => 'preguntas_frecuentes#eliminar'
  post 'pfrecuentes/editar' => 'preguntas_frecuentes#editar'
  post 'pfrecuentes/nuevo' => 'preguntas_frecuentes#nuevo'

  get 'mensajes/gestionar' => 'mensaje#gestionar'
  get 'mensajes/revisar' => 'mensaje#revisar'
  post 'mensajes/eliminar' => 'mensaje#eliminarVARIOS'
  post 'mensaje/eliminar' => 'mensaje#eliminarUNO'
  post 'mensaje/nuevo' => 'mensaje#nuevo'


  get 'info/gestionar' => 'informacion_general#index'
  post 'info/editar' => 'informacion_general#editar'


  get 'pacientes/reporte' => 'paciente#reporte'
  post 'pacientes/reporte/filtrar' => 'paciente#filtrar'


  get '/admin/noticias' => 'noticia#index'
  get 'noticia/nuevo' => 'noticia#nuevo'
  get 'noticia/revisar' => 'noticia#revisar'
  get 'noticia/listar/:busqueda' => 'noticia#listar'
  get 'noticia/:id/editar' => 'noticia#editar'
  post 'noticia/:id/editar' => 'noticia#editarPOST'
  post 'noticia/crear' => 'noticia#crear'
  post 'noticia/eliminar' => 'noticia#eliminar'

  post 'imagen/subir' => 'imagen#subir'


  get 'ciudades' => 'ciudad#index'
  post 'ciudad/datos' => 'ciudad#datos'
  post 'ciudad/nuevo' => 'ciudad#nuevo'
  post 'ciudad/eliminar' => 'ciudad#eliminar'
  post 'ciudad/editar' => 'ciudad#editar'

  get 'patologias' => 'patologia#index'
  post 'patologia/editar' => 'patologia#editar'
  post 'patologia/nuevo' => 'patologia#nuevo'
  post 'patologia/eliminar' => 'patologia#eliminar'

  get 'tipossangre' => 'tipo_sangre#index'
  post 'tiposangre/editar' => 'tipo_sangre#editar'
  post 'tiposangre/nuevo' => 'tipo_sangre#nuevo'
  post 'tiposangre/eliminar' => 'tipo_sangre#eliminar'


  get 'horarios' => 'horario#index'
  post 'horario/nuevo' => 'horario#nuevo'
  post 'horario/eliminar' => 'horario#eliminar'

  get 'tratamientos/:id/editar' => 'tratamientos#editar'
  post 'tratamientos/editar' => 'tratamientos#editarPOST'
  post 'tratamiento/eliminar' => 'tratamientos#eliminar'


  get 'administrador/:id/editar' => 'administradors#editar'
  get 'administrador/perfil' => 'administradors#perfil'
  post 'administrador/perfil' => 'administradors#editarperfil'
  post 'administrador/editar' => 'administradors#editarPOST'
  post 'administrador/eliminar' => 'administradors#eliminar'
  post 'administrador/password' => 'administradors#password'

  get 'equipo/:id/editar' => 'equipos#editar'
  post 'equipo/editar' => 'equipos#editarPOST'
  post 'equipo/eliminar' => 'equipos#eliminar'

  post '/notifcitas' => 'cita#notificar_citas'


  post '/notifs/estado/' => 'alerta#notificacion'
  post '/mensajes/estado/' => 'alerta#mensaje'
  post '/citas/estado/' => 'alerta#cita'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  get 'admin/logout' => "app_principal#logout"
end