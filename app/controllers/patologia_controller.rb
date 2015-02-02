class PatologiaController < ApplicationController
  
  def index
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @titulo = "Gestión de Patologías"
    @patologias = Patologia.all().order("nombre")
    @datos_activo = 'active open'
    @patologia_activo = 'active'
  end

  def editar
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @patologia = Patologia.find(params[:idpatologia])
    @patologia.nombre = params[:patologia]
    @patologia.save()

    @titulo = "Gestión de Patologías"
    @patologias = Patologia.all().order("nombre")
    @notifeditar = true
    @datos_activo = 'active open'
    @patologia_activo = 'active'
    render :index
  end

  def nuevo
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @long = params[:patologia].length-1
    for i in 0..@long
      @patologia = Patologia.new({"nombre"=>params[:patologia][i]})
      @patologia.save()
    end
    @notifnuevo = true
    @titulo = "Gestión de Patologías"
    @patologias = Patologia.all().order("nombre")
    @datos_activo = 'active open'
    @patologia_activo = 'active'
    render :index
  end

  def eliminar
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @patologia = Patologia.find(params[:idpatologia])
    @patologia.delete()
    @notifeliminar = true
    @titulo = "Gestión de Patologías"
    @patologias = Patologia.all().order("nombre")
    @datos_activo = 'active open'
    @patologia_activo = 'active'
    render :index
  end
  
end
