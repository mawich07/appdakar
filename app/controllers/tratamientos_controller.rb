class TratamientosController < ApplicationController

  def index
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @contenido_activo = 'active open'
    @tratamientos_activo = 'active open'
    @tratamientos_listar_activo = 'active'
    @titulo = "Gestión de tratamientos"
    @tratamientos = Tratamiento.all
  end

  def editar
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @contenido_activo = 'active open'
    @tratamientos_activo = 'active open'
    @tratamiento = Tratamiento.find(params[:id])
  end

  def editarPOST
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @tratamiento = Tratamiento.find(params[:tratamiento]["id"])
    @tratamiento.nombre = params[:tratamiento]["nombre"]
    @tratamiento.descripcion = params[:tratamiento]["descripcion"]
    @tratamiento.imagenurl = params[:tratamiento]["imagenurl"]
    if @tratamiento.save
      @titulo = "Nuevo tratamiento"
      @notif = true
      @tratamiento = Tratamiento.find(params[:tratamiento]["id"])
      render :editar
    else
      render "editar"
    end
    @contenido_activo = 'active open'
    @tratamientos_activo = 'active open'
  end

  def new
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @titulo = "Nuevo tratamiento"
    @tratamientos = Tratamiento.new
    @contenido_activo = 'active open'
    @tratamientos_activo = 'active open'
    @tratamientos_nuevo_activo = 'active'
  end

  def create
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @tratamiento = Tratamiento.new(tratamiento_params)
    @contenido_activo = 'active open'
    @tratamientos_activo = 'active open'
    @tratamientos_nuevo_activo = 'active'
    if @tratamiento.save
      @titulo = "Nuevo tratamiento"
      @notif = true
      @tratamientos = Tratamiento.new
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
    @contenido_activo = 'active open'
    @tratamientos_activo = 'active open'
    @tratamientos_listar_activo = 'active'
    @contenido_activo = 'active open'
    @tratamientos_activo = 'active'
    @tratamiento = Tratamiento.find(params[:id])
    @tratamiento.delete()
    @tratamientos = Tratamiento.all
    @notifeliminar = true
    render :index
  end

  private
  def tratamiento_params
    params.require(:tratamiento).permit(:imagenurl, :nombre, :descripcion)
  end

end
