require 'pusher'
require 'restclient'

class AppPrincipalController < ApplicationController
  def index
    @info = InformacionGeneral.find("1")
    @ultimas_noticias = Noticia.all().order("created_at DESC").last(5)
    @horarios = Horario.all()
  end

  def login
    end

  def loginusr
    end

  def loginusrPOST
    @info = InformacionGeneral.find("1")
    @pac = Paciente.find_by({"cedula" => params[:cedula], "password" => params[:password]})
    if @pac != nil then
      session[:paciente] = {"id" => @pac.id, "cedula" => @pac.cedula, "nombres" => @pac.nombres + " " + @pac.apellidos}
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  def loguear
    @admin = Administrador.find_by({"usuario" => params[:usuario], "password" => params[:password]})
    if @admin then
      session[:usuario] = {"id" => @admin.id, "avatar" => @admin.avatar_url, "nombres" => @admin.nombres + " " + @admin.apellidos, "es_super" => @admin.es_super_usuario}
      redirect_to '/admin/'
    end
  end

  def logout
    session[:usuario] = nil
    redirect_to '/admin/login/'
  end

  def paclogout
    session[:paciente] = nil
    redirect_to '/'
  end

  def quienes_somos
    @info = InformacionGeneral.find("1")
  end

  def instalaciones
    @info = InformacionGeneral.find("1")
    @equipos = Equipo.all()
  end

  def tratamiento
    @info = InformacionGeneral.find("1")
    @tratamientos = Tratamiento.all()
  end

  def noticias
    @info = InformacionGeneral.all().last()
    @noticias = Noticia.paginate(:page => params[:page], :per_page => 2).order("created_at DESC")
    @ultimas_noticias = Noticia.all().order("created_at DESC").last(10)
  end

  def noticia_individual
    @info = InformacionGeneral.all().last()
    @n = Noticia.find(params[:id])
    @ultimas_noticias = Noticia.all().order("created_at DESC").last(10)
  end

  def cita
    @citas = Cita.where("fecha >  CURRENT_DATE - INTERVAL '4 months'")
    @info = InformacionGeneral.find("1")
    if session[:paciente] then
      @idpac = session[:paciente]["id"]
    else
      @idpac = -1
    end
  end

  def comollegar
  end
  require 'securerandom'
  def recuperarpass
    puts params[:email]
    @paciente = Paciente.find_by({"email" => params[:email] + ".com"})
    if @paciente != nil then
      @token = SecureRandom.uuid
      @authtoken = AuthToken.new
      @authtoken.token = @token
      @authtoken.activo = true
      @authtoken.paciente = @paciente
      @authtoken.save()
      RestClient.post "https://api:key-785a06b159ece60b3fbb4385dd078fff"\
        "@api.mailgun.net/v2/sandboxa3c6deef437d401b858be07334756325.mailgun.org/messages",
                      :from => "Rehabilitacion Dakar <postmaster@sandboxa3c6deef437d401b858be07334756325.mailgun.org>",
                      :to => "ariel_mcm@outlook.com",
                      :subject => "Recuperacion de contraseña",
                      :text => "Para reestablecer tu contraseña entra en este link http://127.0.0.1:3000/authtoken/"+@paciente.id.to_s()+"/"+@token.to_s()
      render json: {:estado => '1', :email => params[:email]}
    else
      render json: {:estado => '0'}
    end

  end

  def reestablecerpass
    @tokenusr = AuthToken.find_by({"token" => params[:token], "paciente_id" => params[:idusr]})
    if @tokenusr != nil then
        @pac = Paciente.find(params[:idusr])
        @pac.password = params[:password]
        @pac.save()
        @tokenusr.delete()
        @notif = true
        render :login
    end
  end

  def verificartoken
    @tokenusr = AuthToken.find_by({"token" => params[:token], "paciente_id" => params[:idusr]})
    if @tokenusr != nil then
      if @tokenusr.activo then
        @token = params[:token]
        @idusr = params[:idusr]
        @tokenusr.activo = false
        @tokenusr.save()
        render :contrasena
      else
        @mensaje = 'El vinculo de recuperación de contraseña ha expirado.'
        render :error
      end
    else
      @mensaje = 'El vinculo de recuperación de contraseña no es válido.'
      render :error
    end
  end

  def pfrecuentes
    @info = InformacionGeneral.find("1")
    @preguntas = PreguntasFrecuentes.all
  end

  def registro
    @info = InformacionGeneral.find("1")
  end

  def registroPOST
    @info = InformacionGeneral.find("1")
    @par = params[:paciente]
    @paciente = Paciente.new({
                                 "cedula" => @par["cedula"],
                                 "nombres" => @par["nombres"],
                                 "apellidos" => @par["apellidos"],
                                 "password" => @par["password"],
                                 "email" => @par["email"]
                             })
    @paciente.save()

    if @par["telefono"] != "" then
      @tlf = Telefono.new({"numero" => @par["telefono"], "paciente" => @paciente})
      @tlf.save()
    end

    Pusher.app_id = '89963'
    Pusher.key = 'fd8f49298fafccb518e6'
    Pusher.secret = 'a651db09129aeaa4c3dc'
    Pusher.trigger('test_channel', 'my_event', {:tipo => 'nUsuario', :fecha => @paciente.created_at, :id => @paciente.id, :emisor => @par["nombres"] + " " +@par["apellidos"] })
    @alerta = Alerta.new
    @alerta.emisor = @par["nombres"] + " " +@par["apellidos"]
    @alerta.mensaje = @paciente.id
    @alerta.tipo = 1
    @alerta.estado = false
    @alerta.save()
    render :registro
  end
end
