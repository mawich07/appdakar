class EquiposController < ApplicationController

  def index
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @contenido_activo = "active open"
    @equipos_activo = "active open"
    @equipos_listar_activo = "active"
    @titulo = "Gestión de equipos"
    @btnBarraEquipo = true
    @equipos = Equipo.all
  end

  def editar
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @contenido_activo = "active open"
    @equipos_activo = "active open"
    @equipo = Equipo.find(params[:id])
    @titulo = "Editar equipo"
    @contenido_activo = "active open"
    @equipos_activo = "active"
  end

  def editarPOST
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @contenido_activo = "active open"
    @equipos_activo = "active open"
    @equipo = Equipo.find(params[:equipo]["id"])
    @equipo.nombre = params[:equipo]["nombre"]
    @equipo.descripcion = params[:equipo]["descripcion"]
    @equipo.imagenurl = params[:equipo]["imagenurl"]
    if @equipo.save
      @titulo = "Editar equipo"
      @notif = true
      @contenido_activo = "active open"
      @equipos_activo = "active"
      @equipo = Equipo.find(params[:equipo]["id"])
      render :editar
    else
      render "editar"
    end
  end

  def new
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @contenido_activo = "active open"
    @equipos_activo = "active open"
    @equipos_nuevo_activo = "active"
    @titulo = "Nuevo equipo"
    @equipos = Equipo.new
    @contenido_activo = "active open"
    @equipos_activo = "active"
  end

  def create
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @contenido_activo = "active open"
    @equipos_activo = "active open"
    @equipos_nuevo_activo = "active"
    @equipo = Equipo.new(equipo_params)
    if @equipo.save
      @titulo = "Nuevo equipo"
      @notif = true
      @equipos = Equipo.new
      @contenido_activo = "active open"
      @equipos_activo = "active"
      render :new
    else
      render "new"
    end
  end

  def destroy
  end

  def eliminar
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @contenido_activo = "active open"
    @equipos_activo = "active open"
    @equipos_listar_activo = "active"
    @equipo = Equipo.find(params[:id])
    @equipo.delete()
    @equipos = Equipo.all
    @notifeliminar = true
    @contenido_activo = "active open"
    @equipos_activo = "active"
    render :index
  end

  private
  def equipo_params
    params.require(:equipo).permit(:imagenurl, :nombre, :descripcion)
  end

end
