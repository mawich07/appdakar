class CiudadController < ApplicationController

  def index
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @titulo = "Gestión de Ciudades"
    @datos_activo = 'active open'
    @ciudad_activo = 'active'
    @ciudades = Ciudad.all().order("nombre")
  end

  def editar
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @ciudad = Ciudad.find(params[:idciudad])
    @ciudad.nombre = params[:ciudad]
    @ciudad.save()

    @titulo = "Gestión de Ciudades"
    @ciudades = Ciudad.all().order("nombre")
    @notifeditar = true
    @datos_activo = 'active open'
    @ciudad_activo = 'active'
    render :index
  end

  def nuevo
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @long = params[:ciudad].length-1
    for i in 0..@long
      @ciudad = Ciudad.new({"nombre"=>params[:ciudad][i]})
      @ciudad.save()
    end
    @notifnuevo = true
    @titulo = "Gestión de Ciudades"
    @ciudades = Ciudad.all().order("nombre")
    render :index
  end

  def eliminar
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @ciudad = Ciudad.find(params[:idciudad])
    @ciudad.delete()
    @notifeliminar = true
    @titulo = "Gestión de Ciudades"
    @ciudades = Ciudad.all().order("nombre")
    @datos_activo = 'active open'
    @ciudad_activo = 'active'
    render :index
  end

end
