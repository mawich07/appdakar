require 'date'

class PacienteController < ApplicationController

  def nuevo
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @titulo = 'Registro de paciente'
    @paciente_activo = 'active open'
    @pac_n_activo = 'active'
    @ciudades = Ciudad.all()
    @tipo_sangre = TipoSangre.all
  end

  def registrar
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @par = params[:paciente]
    @ciudad = Ciudad.find(@par["ciudad"])
    @paciente = Paciente.new({
                                 "cedula" => @par["cedula"],
                                 "nombres" => @par["nombres"],
                                 "apellidos" => @par["apellidos"],
                                 "direccion" => @par["direccion"],
                                 "genero" => @par["genero"],
                                 "email" => @par["email"],
                                 "fecha_nac" => @par["fecha_nac"],
                                 "tipo_sangre" => @par["tipo_sangre"],
                                 "password" => @par["password"],
                                 "ciudad" => @ciudad
                             })
    @paciente.save()

    @par["telefono"].split(",").each do |numero|
      if numero != "" then
        @tlf = Telefono.new({"numero" => numero, "paciente" => @paciente})
        @tlf.save()
      end
    end

    #redirect_to "/paciente/nuevo"
    @titulo = 'Registro de paciente'
    @paciente_activo = 'active open'
    @pac_n_activo = 'active'
    @ciudades = Ciudad.all()
    @notif = true
    @tipo_sangre = TipoSangre.all
    render :nuevo
  end

  def verificar_paciente
    @paciente = Paciente.find_by_cedula(params[:cedula])
    if @paciente then
      render json: {:status => 'ERROR', :message => 'Ya existe un paciente registrado con esa cédula'}
    else
      render json: {:status => 'OK', :message => 'Disponible'}
    end
  end

  def listar_paciente
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @paciente_activo = "active open"
    @pac_listar_activo = "active"
    @titulo = "Gestión de Pacientes"
    @pacientes = nil
    if params[:query] then
      if params[:criterio] == "ced" then
        @pacientes = Paciente.where("pacientes.cedula like '%"+ params[:query] +"%'")
      else
        @pacientes = Paciente.where("pacientes.nombres like '%"+ params[:query] +"%' OR pacientes.apellidos like '%"+ params[:query] +"%'")
      end
      @criterio = params[:criterio]
      @txtBusq = params[:query]
    else
      @criterio = "ced"
      @pacientes = Paciente.last(25)
    end
    @btnBarra = true
  end


  def editar
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @titulo = 'Actualización de perfil del paciente'
    @paciente_activo = 'active open'
    @ciudades = Ciudad.all()
    @tipo_sangre = TipoSangre.all
    @paciente = Paciente.find(params[:id])
    @pac_telefonos = Telefono.where("paciente_id = '" + params[:id] + "'")
  end

  def editarPOST
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @tipo_sangre = TipoSangre.all
    @par = params[:paciente]
    @ciudad = Ciudad.find(@par["ciudad"])
    @paciente = Paciente.find(params[:id])
    @paciente.cedula = @par["cedula"]
    @paciente.nombres = @par["nombres"]
    @paciente.apellidos = @par["apellidos"]
    @paciente.direccion = @par["direccion"]
    @paciente.email = @par["email"]
    @paciente.genero = @par["genero"]
    @paciente.fecha_nac = @par["fecha_nac"]
    @paciente.tipo_sangre = @par["tipo_sangre"]
    @paciente.ciudad = @ciudad
    @paciente.save()
    @telefonos = Telefono.where("paciente_id = '" + params[:id] + "'")
    @telefonos.destroy_all()

    @par["telefono"].split(",").each do |numero|
      if numero != "" then
        @tlf = Telefono.new({"numero" => numero, "paciente" => @paciente})
        @tlf.save()
      end
    end

    @notif = true
    @titulo = 'Actualización de perfil del paciente'
    @paciente_activo = 'active open'
    @pac_n_activo = 'active'
    @ciudades = Ciudad.all()
    @paciente = Paciente.find(params[:id])
    @pac_telefonos = Telefono.where("paciente_id = '" + params[:id] + "'")
    render :editar
  end

  def reporte
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @paciente_activo = 'active open'
    @pac_reporte_activo = 'active'
    @grafi = "Gráfica lineal"
    @grafica = "li"
    @pat_nombre = "Todas las enfermedades"
    @patologia = "0"
    @titulo = 'Reporte estadístico de pacientes'
    @desde = Date.today-29
    @hasta = Date.today
    @pac_atendidos = Historial.select(:fecha).where('"fecha" between ? and ?', Date.today-29, Date.today).group("fecha").order("fecha").count()
    @total = 0
    @pac_atendidos.each do |p|
      @total += p[1]
    end
    @leyenda = 'PACIENTES ATENDIDOS DEL ' + (Date.today-29).strftime("%d/%m/%Y") + ' AL ' + (Date.today).strftime("%d/%m/%Y") + ' ('+ @total.to_s() +')'
    @enfermedades = Patologia.all()
    @tipo_grafica = 'spline'

    # @paciente = Paciente.find("2")
    # @patologia = Patologia.find("2")
    # for i in 0..100 do
    #   @historial = Historial.new({
    #                                  "fecha" => Date.today-rand(700),
    #                                  "detalle" => "detalle",
    #                                  "tratamiento" => "tratamiento",
    #                                  "paciente" => @paciente,
    #                                  "patologia" => @patologia
    #                              })
    #   @historial.save()
    # end
  end


  def filtrar
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @paciente_activo = 'active open'
    @pac_reporte_activo = 'active'
    @desde = params[:desde]
    @hasta = params[:hasta]
    @patologia = params[:patologia]
    @grafica = params[:grafica]
    @pat_nombre = nil
    if @patologia != "0" then

      @pat_nombre = Patologia.find(@patologia).nombre
      @pac_atendidos = Historial.select(:fecha).where('"patologia_id" = ? and "fecha" between ? and ?', @patologia, @desde, @hasta).group("fecha").order("fecha").count()
      @total = 0
      @pac_atendidos.each do |p|
        @total += p[1]
      end
      @leyenda = 'PACIENTES CON '+ @pat_nombre.upcase() +' ATENDIDOS DEL ' + DateTime.strptime(@desde, '%Y-%m-%d').strftime("%d/%m/%Y") + ' AL ' + DateTime.strptime(@hasta, '%Y-%m-%d').strftime("%d/%m/%Y") + ' ('+ @total.to_s() +')'


    else
      @pat_nombre = "Todas las enfermedades"
      if @grafica == "pa" then
        @pac_atendidos = Patologia.find_by_sql('SELECT nombre, count(*) as cantidad FROM patologia, historials WHERE patologia.id = historials.patologia_id and ("fecha" between \''+ @desde +'\' and \''+ @hasta +'\') group by nombre;')
        @total = 0
        @pac_atendidos.each do |p|
          @total += p.cantidad
        end
        @leyenda = 'PACIENTES SEGÚN ENFERMEDAD ATENDIDOS DEL ' + DateTime.strptime(@desde, '%Y-%m-%d').strftime("%d/%m/%Y") + ' AL ' + DateTime.strptime(@hasta, '%Y-%m-%d').strftime("%d/%m/%Y") + ' ('+ @total.to_s() +')'
      else
        @pac_atendidos = Historial.select(:fecha).where('"fecha" between ? and ?', @desde, @hasta).group("fecha").order("fecha").count()
        @total = 0
        @pac_atendidos.each do |p|
          @total += p[1]
        end
        @leyenda = 'PACIENTES ATENDIDOS DEL ' + DateTime.strptime(@desde, '%Y-%m-%d').strftime("%d/%m/%Y") + ' AL ' + DateTime.strptime(@hasta, '%Y-%m-%d').strftime("%d/%m/%Y") + ' ('+ @total.to_s() +')'
      end
    end
    @grafi = nil
    #@pac_atendidos.sum(:cantidad)
    if @grafica == "li" then
      @grafi = "Gráfica lineal"
      @tipo_grafica = 'spline'
    elsif @grafica == "pa"
      @grafi = "Gráfica de pastel"
      @tipo_grafica = 'pie'
    elsif @grafica == "co"
      @grafi = "Gráfica de columnas"
      @tipo_grafica = 'column'
    elsif @grafica == "ba"
      @grafi = "Gráfica de barras"
      @tipo_grafica = 'bar'
    end

    @titulo = 'Reporte estadístico de pacientes'


    @enfermedades = Patologia.all()
    render :reporte
  end

end
