module ApplicationHelper

  def como_llegar
    @llegar = InformacionGeneral.all().last().como_llegar
  end

  def direccion
    @info = InformacionGeneral.all().last().direccion
  end

  def telefono_fijo
    @info = InformacionGeneral.all().last().numero_fijo
  end

  def telefono_movil
    @info = InformacionGeneral.all().last().numero_movil
  end

  def email
    @info = InformacionGeneral.all().last().email
  end

 def sesion_paciente
   if session[:paciente] then
     return ('<button style="cursor: default" id="btn" type="button" class="btn btn-primary btnSesion">'+session[:paciente]["nombres"]+'</button>
<button id="btnLogout" type="button" title="Cerrar sesión" class="btn btn-warning btnSesion"><i class="fa fa-power-off"></i></button>').html_safe
   else
     return '<button id="btnAcceder" type="button" class="btn btn-primary btnSesion">Acceder</button>
            <button id="btnRegistro" type="button" class="btn btn-warning btnSesion">Registrar</button>
          '.html_safe
   end
 end

  def ultimasnoticias
    @ultimas_noticias = Noticia.all().order("created_at DESC").last(4)
    @notis = ''
    @ultimas_noticias.each do |n|
      @notis += '<li><i class="fa fa-angle-right"></i><a href="/vernoticia/'+n.id.to_s()+'">'+n.titulo+'</a><br> <a href="#">'+n.created_at.to_date().to_s()+'</a></li>'
    end
    return @notis.html_safe
  end

  def nombre_usuario
    session[:usuario]["nombres"]
  end

  def usuario_es_super
    session[:usuario]["es_super"]
  end

  def usuario_avatar_url
    session[:usuario]["avatar"]
  end

  def  verif_notificacion
    @mostrar_notif = false
    @noti = Notificacion.find_by_fecha(Date.today())
    if @noti == nil then
      @mostrar_notif = true
    end

    @notif = Cita.where({"fecha" => DateTime.current}).count
    # @notif.each do |c|
    #   puts c.hora
    # end
    if @notif == 0 then
      @mostrar_notif = false
    end
    return @mostrar_notif
  end

  def alerta_notif_cont
    @alerta = Alerta.where({"tipo" => 1, "estado" => false}).count
  end

  def alerta_mens_cont
    @alerta = Alerta.where({"tipo" => 2, "estado" => false}).count
  end

  def alerta_citas_cont
    @alerta = Alerta.where({"tipo" => 3, "estado" => false}).count
  end

  def alerta_notif
    @alerta = Alerta.where({"tipo" => 1}).order("created_at DESC")
    @alertas = ""
    @alerta.each do |notif|
      @alertas += '<li>
    <a href="/paciente/' + notif.mensaje + '/editar/">
        <span class="label label-sm label-icon label-success">
    <i class="icon-user-follow"></i>
                </span>
        <strong>' + notif.emisor + '</strong> - <span class="time">
    <time class="timeago" datetime="' + notif.created_at.iso8601 + '"></time> </span>
    </a>
                </li>'
    end
    return @alertas.html_safe

    # @alertas = {"alertas" => []}
    # @alerta.each do |a|
    #   @alertas["alerta"].push([a.emisor, a.mensaje, a.created_at])
    # end
    # reder json: @alertas
  end

  def alerta_mensaje
    @alerta = Alerta.where({"tipo" => 2}).order("created_at DESC")
    @alertas = ""
    @alerta.each do |mens|
      @alertas += '<li>
                            <a href="#">
                        <span class="photo">
                            <span style="padding-right: 4px" class="label label-sm label-icon label-success">
                        <i class="icon-envelope"></i>
                </span></span>
                    <span class="subject">
                            <span class="from">
                            ' + mens.emisor + ' </span>
                    <span class="time">
                            <time class="timeago" datetime="' + mens.created_at.iso8601 + '"></time> </span>
                    </span>
                    <span class="message">
                            ' + mens.mensaje + '... </span>
                    </a>
                    </li>'
    end
    return @alertas.html_safe
  end

  def alerta_cita
    @alerta = Alerta.where({"tipo" => 3}).order("created_at DESC")
    @alertas = ""
    @alerta.each do |cita|
      @alertas += '<li>
                            <a>
                        <span class="photo">
                            <span style="padding-right: 4px" class="label label-sm label-icon label-success">
                        <i class="icon-calendar"></i>
                </span></span>
                    <span class="subject">
                            <span class="from">
                            ' + cita.emisor + ' </span>
                    <span class="time">
                            <time class="timeago" datetime="' + cita.created_at.iso8601 + '"></time> </span>
                    </span>
                    <span class="message">
                            ' + cita.mensaje + ' </span>
                    </a>
                    </li>'
    end
    return @alertas.html_safe
  end
end