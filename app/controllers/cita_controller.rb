require 'pusher'
require 'rubygems'
require 'twilio-ruby'
class CitaController < ApplicationController

    def gestionar
      if session[:usuario] == nil then
        render :'app_principal/login'
        return
      end
      @titulo = 'Gestión de citas'
      @citas_activo = 'active open'
      @citas_g_activo = 'active'
      @citas = Cita.where("fecha >  CURRENT_DATE - INTERVAL '4 months'")
      print(Date.current)

    end

    def vacio

    end

    def datos
      @cita = Cita.find(params[:id])
      if @cita.paciente != nil then
        @tlf = Telefono.find_all_by_paciente_id(@cita.paciente.id)
        @telefonos = ""
        @tlf.each do |t|
          @telefonos += t.numero+", "
        end
        @telefonos = @telefonos[0,@telefonos.length-2]
      else
        @telefonos = @cita.telefono_movil
      end

    end

    def verificar
      @paciente = Paciente.find_by_cedula(params[:cedula])
      if @paciente then
        render json: {:status => 'OK', :message => 'Disponible'}
      else
        render json: {:status => 'ERROR', :message => ''}
      end
    end

    def nuevo
      if session[:usuario] == nil then
        render :'app_principal/login'
        return
      end
      @cita = Cita.new
      @cita.hora = params[:hora]
      @cita.fecha = params[:fecha]
      @cita.paciente = Paciente.find_by_cedula(params[:paciente])
      @cita.save()
      @titulo = 'Gestión de citas'
      @citas_activo = 'active open'
      @citas_g_activo = 'active'
      @citas = Cita.where("fecha >  CURRENT_DATE - INTERVAL '4 months'")
      @notifnuevo = true
      render :gestionar
    end

    def nuevousr
      if session[:usuario] == nil then
        render :'app_principal/login'
        return
      end
      @cita = Cita.new
      @cita.hora = params[:hora]
      @cita.fecha = params[:fecha]
      @pac = nil
      if session[:paciente] then
        @cita.paciente = Paciente.find_by_cedula(session[:paciente]["cedula"])
        @pac = @cita.paciente.nombres + " " + @cita.paciente.apellidos
      else
        @pac = params[:paciente]
        @cita.nombre = @pac
        @cita.telefono_movil = params[:telefono]
      end

      @cita.save()

      Pusher.app_id = '89963'
      Pusher.key = 'fd8f49298fafccb518e6'
      Pusher.secret = 'a651db09129aeaa4c3dc'
      Pusher.trigger('test_channel', 'my_event', {:tipo => 'nCita',
                                                  :emisor => @pac,
                                                  :mensaje => "Cita para el " + params[:fecha] + " a las " + params[:hora],
                                                  :fecha => @cita.created_at})
      @alerta = Alerta.new
      @alerta.emisor = @pac
      @alerta.mensaje = "Cita para el " + params[:fecha] + " a las " + params[:hora]
      @alerta.tipo = 3
      @alerta.estado = false
      @alerta.save()

      redirect_to "/cita"
    end

    def editar
      if params[:btnCancelar] then
        @cita = Cita.find(params[:idcita])
        @cita.delete()
      else
        @cita = Cita.find(params[:idcita])

        @fecha = Date.parse(params[:fecha])
        @d = @fecha.strftime("%a")
        case @d
          when "Mon"
            @dia = Dia.find_by_nombre("Mon")
            @horas = HoraCita.where("dias_id = "+@dia.id.to_s()).order("hora")
          when "Tue"
            @dia = Dia.find_by_nombre("Tue")
            @horas = HoraCita.where("dias_id = "+@dia.id.to_s()).order("hora")
          when "Wed"
            @dia = Dia.find_by_nombre("Wed")
            @horas = HoraCita.where("dias_id = "+@dia.id.to_s()).order("hora")
          when "Thu"
            @dia = Dia.find_by_nombre("Thu")
            @horas = HoraCita.where("dias_id = "+@dia.id.to_s()).order("hora")
          when "Fri"
            @dia = Dia.find_by_nombre("Fri")
            @horas = HoraCita.where("dias_id = "+@dia.id.to_s()).order("hora")
          when "Sat"
            @dia = Dia.find_by_nombre("Sat")
            @horas = HoraCita.where("dias_id = "+@dia.id.to_s()).order("hora")
          when "Sun"
            @dia = Dia.find_by_nombre("Sun")
            @horas = HoraCita.where("dias_id = "+@dia.id.to_s()).order("hora")
        end
        @n_citas = Cita.find_all_by_fecha(@fecha)
        @horas_citas = []
        @arr_citas = []
        if @n_citas != nil then
          @n_citas.each do |p|
            @arr_citas.push(p.hora)
          end
        end

        @horas.reverse_order.each do |p|
          @horas_citas.push(p.hora)
        end
        @nhora = nil
        @bandera = false
        puts @arr_citas
        @horas_citas.each do |h|
          if !@arr_citas.include? h.strftime("%H:%M") then
            @nhora = h.strftime("%H:%M")
            @bandera = true
          end
          puts(h.to_s + " no esta en arrcitas\n")
        end

        if !@bandera then
          if session[:usuario] != nil then
            @titulo = 'Gestión de citas'
            @citas_activo = 'active open'
            @citas_g_activo = 'active'
            @citas = Cita.where("fecha >  CURRENT_DATE - INTERVAL '4 months'")
            @notifvacante = true
            render :gestionar
          else
            redirect_to("/cita/")
          end
        end
        @cita.fecha = @fecha
        @cita.hora = @nhora
        @cita.save()
        @notiffecha = true
      end

      if session[:usuario] != nil then
        @titulo = 'Gestión de citas'
        @citas_activo = 'active open'
        @citas_g_activo = 'active'
        @citas = Cita.where("fecha >  CURRENT_DATE - INTERVAL '4 months'")
        @notifvacante = true
        render :gestionar
      else
        redirect_to("/cita/")
      end
    end

  def hora
    @fecha = Date.parse(params[:id])
    @d = @fecha.strftime("%a")
    case @d
      when "Mon"
        @dia = Dia.find_by_nombre("Mon")
        @horas = HoraCita.where("dias_id = "+@dia.id.to_s()).order("hora")
      when "Tue"
        @dia = Dia.find_by_nombre("Tue")
        @horas = HoraCita.where("dias_id = "+@dia.id.to_s()).order("hora")
      when "Wed"
        @dia = Dia.find_by_nombre("Wed")
        @horas = HoraCita.where("dias_id = "+@dia.id.to_s()).order("hora")
      when "Thu"
        @dia = Dia.find_by_nombre("Thu")
        @horas = HoraCita.where("dias_id = "+@dia.id.to_s()).order("hora")
      when "Fri"
        @dia = Dia.find_by_nombre("Fri")
        @horas = HoraCita.where("dias_id = "+@dia.id.to_s()).order("hora")
      when "Sat"
        @dia = Dia.find_by_nombre("Sat")
        @horas = HoraCita.where("dias_id = "+@dia.id.to_s()).order("hora")
      when "Sun"
        @dia = Dia.find_by_nombre("Sun")
        @horas = HoraCita.where("dias_id = "+@dia.id.to_s()).order("hora")
    end

    @n_citas = Cita.find_all_by_fecha(@fecha)
    @horas_citas = []
    @arr_citas = []
    if @n_citas != nil then
      @n_citas.each do |p|
        @arr_citas.push(p.hora)
      end
    end

    @horas.reverse_order.each do |p|
      @horas_citas.push(p.hora)
    end
    @nhora = nil
    @bandera = false
    puts @arr_citas
    @horas_citas.each do |h|
      if !@arr_citas.include? h.strftime("%H:%M") then
        @nhora = h.strftime("%H:%M")
        @bandera = true
      end
      puts(h.to_s + " no esta en arrcitas\n")
    end

    if !@bandera then
      render :vacio
    end

    # @n_citas = Cita.find_by_sql("select count(*) as cantidad from cita where fecha = '" + @fecha.to_s() + "'" )
    # @cantidad = 0
    # @n_citas.each do |p|
    #   @cantidad = p.cantidad
    #   break
    # end
    # @cont = -1
    # @hora = nil
    # @horas.each do |p|
    #   @cont+=1
    #   if @cont == @cantidad then
    #     @hora = p.hora
    #   end
    # end

  end


    def horausr
      @fecha = Date.parse(params[:id])
      @d = @fecha.strftime("%a")
      case @d
        when "Mon"
          @dia = Dia.find_by_nombre("Mon")
          @horas = HoraCita.where("dias_id = "+@dia.id.to_s()).order("hora")
        when "Tue"
          @dia = Dia.find_by_nombre("Tue")
          @horas = HoraCita.where("dias_id = "+@dia.id.to_s()).order("hora")
        when "Wed"
          @dia = Dia.find_by_nombre("Wed")
          @horas = HoraCita.where("dias_id = "+@dia.id.to_s()).order("hora")
        when "Thu"
          @dia = Dia.find_by_nombre("Thu")
          @horas = HoraCita.where("dias_id = "+@dia.id.to_s()).order("hora")
        when "Fri"
          @dia = Dia.find_by_nombre("Fri")
          @horas = HoraCita.where("dias_id = "+@dia.id.to_s()).order("hora")
        when "Sat"
          @dia = Dia.find_by_nombre("Sat")
          @horas = HoraCita.where("dias_id = "+@dia.id.to_s()).order("hora")
        when "Sun"
          @dia = Dia.find_by_nombre("Sun")
          @horas = HoraCita.where("dias_id = "+@dia.id.to_s()).order("hora")
      end

      @n_citas = Cita.find_all_by_fecha(@fecha)
      @horas_citas = []
      @arr_citas = []
      if @n_citas != nil then
        @n_citas.each do |p|
          @arr_citas.push(p.hora)
        end
      end

      @horas.reverse_order.each do |p|
        @horas_citas.push(p.hora)
      end
      @nhora = nil
      @bandera = false
      puts @arr_citas
      @horas_citas.each do |h|
        if !@arr_citas.include? h.strftime("%H:%M") then
          @nhora = h.strftime("%H:%M")
          @bandera = true
        end
        puts(h.to_s + " no esta en arrcitas\n")
      end

      if !@bandera then
        render :vacio
      end
      if session[:paciente] then
        render "horapaciente"
      end

      # @n_citas = Cita.find_by_sql("select count(*) as cantidad from cita where fecha = '" + @fecha.to_s() + "'" )
      # @cantidad = 0
      # @n_citas.each do |p|
      #   @cantidad = p.cantidad
      #   break
      # end
      # @cont = -1
      # @hora = nil
      # @horas.each do |p|
      #   @cont+=1
      #   if @cont == @cantidad then
      #     @hora = p.hora
      #   end
      # end

    end

  def notificar_citas
    account_sid = 'ACfe09c7650cdd120c75ef3e9b03ed7a02'
    auth_token = '6462937bae5703332528ce3d75bbcf6e'
    @client = Twilio::REST::Client.new account_sid, auth_token

    @citas = Cita.where({"fecha" => DateTime.current}).all
    @citas.each do |cita|
      if cita.paciente != nil then
        @telf = Telefono.where({"paciente_id" => cita.paciente.id}).all
        @telf.each do |tlf|
          if tlf.numero.length == 10 then
            puts tlf.numero
            @client.account.messages.create({
                                                :from => '+12019031861',
                                                :to => '+593'+tlf.numero[1..-1],
                                                :body => 'Saludos ' + cita.paciente.nombres + ', el CENTRO DE REHABILITACION DAKAR AGUIRRE le recuerda que manana tiene una cita a las ' + cita.hora + '.'
                                            })
            break
          end
        end
      else
        @client.account.messages.create({
                                            :from => '+12019031861',
                                            :to => '+593'+cita.telefono_movil[1..-1],
                                            :body => 'Saludos ' + cita.nombre.split(" ")[0] + ', el CENTRO DE REHABILITACION DAKAR AGUIRRE le recuerda que manana tiene una cita a las ' + cita.hora + '.'
                                        })
      end
    end

    @notif = Notificacion.all().last
    if @notif == nil then
      @n = Notificacion.new({"fecha" => Date.today()})
      @n.save()
    else
      @notif.fecha = Date.today()
      @notif.save()
    end

    render json: {:status => 'OK', :message => 'Disponible'}

  end

end
