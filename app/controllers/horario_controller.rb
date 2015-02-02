class HorarioController < ApplicationController
  def index
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @titulo = "Horarios de atención"
    @horarios = Horario.all
    @datos_activo = 'active open'
    @datos_horario_activo = 'active'
  end

  def eliminar
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @horario = Horario.find(params[:id])
    @horario.dias.to_s().split('-').each do |h|
    @dia = nil
      case h
        when "Lun"
          @dia = Dia.find_by_nombre("Mon")

        when "Mar"
          @dia = Dia.find_by_nombre("Tue")
        when "Mie"
          @dia = Dia.find_by_nombre("Wed")
        when "Jue"
          @dia = Dia.find_by_nombre("Thu")
        when "Vie"
          @dia = Dia.find_by_nombre("Fri")
        when "Sáb"
          @dia = Dia.find_by_nombre("Sat")
        when "Dom"
          @dia = Dia.find_by_nombre("Sun")
      end
      @horacita = HoraCita.where("dias_id = " + @dia.id.to_s())
      @horacita.delete_all()
    end


    @horario.delete()
    @titulo = "Horarios de atención"
    @horarios = Horario.all
    @datos_activo = 'active open'
    @datos_horario_activo = 'active'
    render :index
  end

  def nuevo
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @dias = params[:dias]
    @turnos = params[:turnos]
    @horario = Horario.new
    @horario.dias = @dias
    @horario.rango_horas = params[:desde] + " - " + params[:hasta]
    @horario.save()

    @diasArr = @dias.split("-")
    @horasArr = @turnos.split(",")
    print(@diasArr)
    print(@horasArr)
    @diasArr.each do |p|
      print(p)
      case p
        when "Lun"
          @dia = Dia.find_by_nombre("Mon")
          @horasArr.each do |h|
            @h = HoraCita.new
            @h.hora = h
            @h.dias_id = @dia.id
            @h.save()
          end
        when "Mar"
          @dia = Dia.find_by_nombre("Tue")
          @horasArr.each do |h|
            @h = HoraCita.new
            @h.hora = h
            @h.dias_id = @dia.id
            @h.save()
          end
        when "Mie"
          @dia = Dia.find_by_nombre("Wed")
          @horasArr.each do |h|
            @h = HoraCita.new
            @h.hora = h
            @h.dias_id = @dia.id
            @h.save()
          end
        when "Jue"
          @dia = Dia.find_by_nombre("Thu")
          @horasArr.each do |h|
            @h = HoraCita.new
            @h.hora = h
            @h.dias_id = @dia.id
            @h.save()
          end
        when "Vie"
          @dia = Dia.find_by_nombre("Fri")
          @horasArr.each do |h|
            @h = HoraCita.new
            @h.hora = h
            @h.dias_id = @dia.id
            @h.save()
          end
        when "Sáb"
          @dia = Dia.find_by_nombre("Sat")
          @horasArr.each do |h|
            @h = HoraCita.new
            @h.hora = h
            @h.dias_id = @dia.id
            @h.save()
          end
        when "Dom"
          @dia = Dia.find_by_nombre("Sun")
          @horasArr.each do |h|
            @h = HoraCita.new
            @h.hora = h
            @h.dias_id = @dia.id
            @h.save()
          end
      end
    end


    @titulo = "Horarios de atención"
    @horarios = Horario.all
    render :index
  end
end
