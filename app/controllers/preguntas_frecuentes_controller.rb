class PreguntasFrecuentesController < ApplicationController
  def listar
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @titulo = 'Preguntas Frecuentes'
    @preg = PreguntasFrecuentes.all()
    @contenido_activo = 'active open'
    @pfrecuentes_activo = 'active'
  end

  def nuevo
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @long = params[:pregunta].length-1
    for i in 0..@long
      @preguntaf = PreguntasFrecuentes.new({"pregunta"=>params[:pregunta][i],
                                           "respuesta"=>params[:respuesta][i]})
      @preguntaf.save()
    end
    @notifnuevo = true
    @titulo = 'Preguntas Frecuentes'
    @preg = PreguntasFrecuentes.all()
    @contenido_activo = 'active open'
    @pfrecuentes_activo = 'active'
    render :listar
  end

  def editar
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @titulo = 'Preguntas Frecuentes'
    @preg = PreguntasFrecuentes.all()
    @pfrecuente = PreguntasFrecuentes.find(params[:idpregunta])
    @pfrecuente.pregunta = params[:pregunta]
    @pfrecuente.respuesta = params[:respuesta]
    @pfrecuente.save()
    @notifeditar = true
    @titulo = 'Preguntas Frecuentes'
    @preg = PreguntasFrecuentes.all
    @contenido_activo = 'active open'
    @pfrecuentes_activo = 'active'
    render :listar
  end

  def eliminar
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @pfrecuente = PreguntasFrecuentes.find(params[:idpregunta])
    @pfrecuente.delete()
    @titulo = 'Preguntas Frecuentes'
    @preg = PreguntasFrecuentes.all
    @notifeliminar = true
    @contenido_activo = 'active open'
    @pfrecuentes_activo = 'active'
    render :listar
  end
end
