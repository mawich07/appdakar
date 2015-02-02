class AlertaController < ApplicationController

  def notificacion
    @alerta = Alerta.where({"tipo" => 1, "estado" => false})
    @alerta.each do |a|
      a.estado = true
      a.save()
    end

    render json: {"estado" => "OK"}
  end

  def mensaje
    @alerta = Alerta.where({"tipo" => 2, "estado" => false})
    @alerta.each do |a|
      a.estado = true
      a.save()
    end

    render json: {"estado" => "OK"}
  end

  def cita
    @alerta = Alerta.where({"tipo" => 3, "estado" => false})
    @alerta.each do |a|
      a.estado = true
      a.save()
    end

    render json: {"estado" => "OK"}
  end

end
