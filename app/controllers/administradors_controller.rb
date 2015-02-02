class AdministradorsController < ApplicationController

  def index
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @admin_activo = "active open"
    @admin_revisar_activo = "active"
    @btnBarraAdmin = true
    @titulo = "Gestión de administradores"
    @admins = Administrador.all
  end

  def perfil
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @titulo = "Editar perfil"
    @admin = Administrador.find(session[:usuario]["id"])
    @admin_activo = "active open"
  end

  def new
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @admin_activo = "active open"
    @admin_n_activo = "active"
    @titulo = "Nuevo administrador del sitio"
    @resume = Administrador.new
  end

  def create
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @resume = Administrador.new(administrador_params)
    @admin_activo = "active open"
    @admin_n_activo = "active"
    if @resume.save
      @titulo = "Nuevo administrador del sitio"
      @notif = true
      render "new"
    else
      render "new"
    end
  end

  def destroy
  end

  def editar
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @titulo = "Editar administrador"
    @admin = Administrador.find(params[:id])
    @admin_activo = "active open"
  end

  def editarPOST
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @admin = Administrador.find(params[:administrador]["id"])
    @admin.avatar = params[:administrador]["avatar"]
    @admin.nombres = params[:administrador]["nombres"]
    @admin.usuario = params[:administrador]["usuario"]
    @admin.apellidos = params[:administrador]["apellidos"]
    if params[:administrador]["es_super_usuario"] then
      @admin.es_super_usuario = params[:administrador]["es_super_usuario"]
    end
    @admin_activo = "active open"
    if @admin.save
      @titulo = "Editar administrador"
      @notif = true
      @admin = Administrador.find(params[:administrador]["id"])

      if @admin.id == session[:usuario]["id"] then
        session[:usuario]["nombres"] = @admin.nombres + " " + @admin.apellidos
        session[:usuario]["avatar"] = @admin.avatar_url
        session[:usuario]["es_super"] = @admin.es_super_usuario
      end

      render :editar
    else
      render "editar"
    end
    end


  def editarperfil
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @admin = Administrador.find(params[:administrador]["id"])
    @admin.avatar = params[:administrador]["avatar"]
    @admin.nombres = params[:administrador]["nombres"]
    @admin.usuario = params[:administrador]["usuario"]
    @admin.apellidos = params[:administrador]["apellidos"]
    if params[:administrador]["es_super_usuario"] then
      @admin.es_super_usuario = params[:administrador]["es_super_usuario"]
    end
    @admin_activo = "active open"
    if @admin.save
      @notif = true

      if @admin.id == session[:usuario]["id"] then
        session[:usuario]["nombres"] = @admin.nombres + " " + @admin.apellidos
        session[:usuario]["avatar"] = @admin.avatar_url
        session[:usuario]["es_super"] = @admin.es_super_usuario
      end

      render :perfil
    else
      redirect_to "administrador/perfil"
    end
  end

  def eliminar
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @titulo = "Gestión de administradores"
    @admin = Administrador.find(params[:id])
    @admin.delete()
    @admins = Administrador.all
    @notifeliminar = true
    @btnBarraAdmin = true
    @admin_activo = "active open"
    @admin_n_activo = "active"
    render :index
  end

  def password
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @admin = Administrador.find(params[:idadmin])
    if params[:passAnterior] == @admin.password then
      @admin.password = params[:passNueva]
      @admin.save()
      @titulo = "Editar perfil"
      @notifok = true
      render :editar
    else
      @titulo = "Editar perfil"
      @notiferror = true
      render :editar
    end

  end

  private
  def administrador_params
    params.require(:administrador).permit(:avatar, :usuario, :password, :nombres, :apellidos, :es_super_usuario)
  end
end
