class NoticiaController < ApplicationController
  def index
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @btnBarraNoticia = true
    @noticias = Noticia.all
    @contenido_activo = 'active open'
    @noticias_activo = 'active open'
    @noticias_listar_activo = 'active'
    @titulo = "Gestión de noticias"
  end

  def listar
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @noticias = Noticia.where("noticia.titulo like '%"+ params[:busqueda] +"%'")
    @contenido_activo = 'active open'
    @noticias_activo = 'active open'
    @noticias_listar_activo = 'active'
    @titulo = "Gestión de noticias"
    render :index
  end

  def nuevo
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @titulo = "Nueva noticia"
    @contenido_activo = 'active open'
    @noticias_activo = 'active open'
    @noticias_nueva_activo = 'active'
  end

  def crear
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @noticia = Noticia.new
    @noticia.titulo = params[:ntitulo]
    @noticia.imagen = params[:imagen]
    @noticia.noticia = params[:noticia]
    @noticia.detalle = params[:detalle]
    @noticia.administrador = Administrador.find(session[:usuario]["id"])
    @noticia.save()

    @titulo = "Nueva noticia"
    @contenido_activo = 'active open'
    @noticias_activo = 'active open'
    @noticias_nueva_activo = 'active'
    @notif = true
    render :nuevo
  end

  def revisar
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @noticia = Noticia.find(params[:id])
  end

  def editar
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @usuario = session[:nombres]
    @titulo = "Editar noticia"
    @contenido_activo = 'active open'
    @noticias_activo = 'active open'
    @noticia = Noticia.find(params[:id])
  end

  def editarPOST
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @usuario = session[:nombres]
    @noticia = Noticia.find(params[:id])
    @noticia.titulo = params[:ntitulo]
    @noticia.noticia = params[:noticia]
    @noticia.save()

    @titulo = "Editar noticia"
    @notif = true
    @contenido_activo = 'active open'
    @noticias_activo = 'active open'
    render :editar
  end


  def eliminar
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @usuario = session[:nombres]
    @noticia = Noticia.find(params[:idnoticia])
    @noticia.delete()
    @noticias = Noticia.all
    @contenido_activo = 'active open'
    @noticias_activo = 'active open'
    @noticias_listar_activo = 'active'
    @notifeliminar = true
    @titulo = "Gestión de noticias"
    render :index
  end

end
