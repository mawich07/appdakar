require 'pusher'

class MensajeController < ApplicationController
  def nuevo
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @mensaje = Mensaje.new
    @mensaje.nombre = params[:nombre]
    @mensaje.email = params[:email]
    @mensaje.motivo = params[:motivo]
    @mensaje.mensaje = params[:mensaje]
    @mensaje.save()
    Pusher.app_id = '89963'
    Pusher.key = 'fd8f49298fafccb518e6'
    Pusher.secret = 'a651db09129aeaa4c3dc'
    Pusher.trigger('test_channel', 'my_event', {:tipo => 'nMensaje', :emisor => params[:nombre],
                                                :mensaje => params[:mensaje].first(15),
                                                :fecha => @mensaje.created_at})

    @alerta = Alerta.new
    @alerta.emisor = params[:nombre]
    @alerta.mensaje = params[:mensaje].first(15)
    @alerta.tipo = 2
    @alerta.estado = false
    @alerta.save()

    redirect_to "/"
  end

  def revisar
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @mensaje = Mensaje.find(params[:id])

    @mensaje.estado = true
    @mensaje.save()
  end

  def eliminarVARIOS
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @mensajes_activo = 'active open'
    params[:msj].each do |m|
      @m = Mensaje.find(m)
      @m.delete()
    end
    @titulo = "Gestión de Mensajes"
    @mensajes = Mensaje.all()
    @notifeliminar = true
    render :gestionar
  end

  def eliminarUNO
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @mensajes_activo = 'active open'
    @mensaje = Mensaje.find(params[:idmensaje])
    @mensaje.delete()
    @titulo = "Gestión de Mensajes"
    @mensajes = Mensaje.all()
    @notifeliminar = true
    render :gestionar
  end

  def gestionar
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @mensajes_activo = 'active open'
    @titulo = "Gestión de Mensajes"
    @mensajes = Mensaje.all()
  end
end
