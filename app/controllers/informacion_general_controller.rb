class InformacionGeneralController < ApplicationController

  def index
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @titulo = 'Información de la empresa'
    @datos_activo = 'active open'
    @datos_empresa_activo = 'active'

    unless InformacionGeneral.exists?(1)
      @info = {"nombre_empresa"=>"", "direccion"=>"", "numero_movil"=>"",
               "numero_fijo"=>"", "email"=>"", "como_llegar"=>"",
               "quienes_somos"=>"", "trayectoria"=>"", "valores"=>"",
               "mision"=>"", "vision"=>"", "politicas_calidad"=>"" }
    else
      @info = InformacionGeneral.find(1)
    end
  end

  def editar
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    unless InformacionGeneral.exists?(1)
      @info = InformacionGeneral.new( {"nombre_empresa"=>params[:nombre], "direccion"=>params[:direccion], "numero_movil"=>params[:movil],
               "numero_fijo"=>params[:fijo], "email"=>params[:email], "como_llegar"=>params[:c_llegar],
               "quienes_somos"=>params[:q_somos], "trayectoria"=>params[:trayectoria], "valores"=>params[:valores],
               "mision"=>params[:mision], "vision"=>params[:vision], "politicas_calidad"=>params[:p_calidad] } )
      @info.save()
    else
      @info = InformacionGeneral.find(1)
      @info.nombre_empresa = params[:nombre]
      @info.direccion = params[:direccion]
      @info.numero_movil = params[:movil]
      @info.numero_fijo = params[:fijo]
      @info.email = params[:email]
      @info.como_llegar = params[:c_llegar]
      @info.quienes_somos = params[:q_somos]
      @info.trayectoria = params[:trayectoria]
      @info.valores = params[:valores]
      @info.mision = params[:mision]
      @info.vision = params[:vision]
      @info.politicas_calidad = params[:p_calidad]
      @info.save()
    end

    @titulo = 'Información de la empresa'
    @datos_activo = 'active open'
    @datos_empresa_activo = 'active'
    @notif = true
    render :index
  end

end