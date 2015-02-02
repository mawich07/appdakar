class HistorialController < ApplicationController

  def todo
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @tlf = Telefono.where("paciente_id = " + params[:id])
    @telefonos = ""
    @tlf.each do |t|
      @telefonos += t.numero+", "
    end
    @telefonos = @telefonos[0,@telefonos.length-2]
    @paciente = Paciente.find(params[:id])
    @titulo = "Historial de " + @paciente.nombres + " " + @paciente.apellidos
    @historiales = Historial.where("paciente_id = " + @paciente.id.to_s).order("fecha DESC")

    @histDict = {}
    @historiales.each do |hist|
      if !@histDict[hist.patologia.nombre] then
        @histDict[hist.patologia.nombre] = []
      end
    end

    @historiales.each do |hist|
      @histDict[hist.patologia.nombre].push( [hist.id, hist.fecha, hist.detalle, hist.tratamiento] )
    end

  end

  def nuevo
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @paciente = Paciente.find(params[:id])
    @titulo = "Nuevo historial para " + @paciente.nombres + " " + @paciente.apellidos
    @patologias = Patologia.all()
  end

  def nuevoPOST
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @hist = params[:historial]
    @paciente = Paciente.find(params[:id])
    @patologia = Patologia.find(@hist["patologia"])
    @titulo = "Nuevo historial para " + @paciente.nombres + " " + @paciente.apellidos
    @historial = Historial.new({
                                   "fecha" => @hist["fecha"],
                                   "detalle" => @hist["detalle"],
                                   "tratamiento" => @hist["tratamiento"],
                                   "paciente" => @paciente,
                                   "patologia" => @patologia
                               })
    @historial.save()

    redirect_to "/paciente/" + params[:id] + "/historial"
  end

  def revisar
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @historial = Historial.find(params[:id])
  end


  def editar
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @historial = Historial.find(params[:id])
    @titulo = "Historial de " + @historial.paciente.nombres + " " + @historial.paciente.apellidos + " del " + @historial.fecha.to_s
    @patologias = Patologia.all()
    if params[:notif] then
      @notif = true
    end
  end


  def editarPOST
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @hist = params[:historial]
    @historial = Historial.find(params[:id])
    @patologia = Patologia.find(@hist["patologia"])
    @titulo = "Historial de " + @historial.paciente.nombres + " " + @historial.paciente.apellidos
    @historial.fecha = @hist["fecha"]
    @historial.detalle = @hist["detalle"]
    @historial.tratamiento = @hist["tratamiento"]
    @historial.save()

    redirect_to(controller: 'historial', action: "editar", id: params[:id], notif: true)
  end


  def eliminar
    @historial = Historial.find(params[:id])
    @historial.delete()
    render json: {:estado => 'OK'}
  end

end
