
class AdminController < ApplicationController
  def panel
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
      @titulo = 'Panel De Control'
      @panel_activo = 'active'

      @cons_mes_pasado = Cita.where('"fecha" between \''+Date.current.last_month().year().to_s()+'-'+Date.current.last_month().month().to_s()+'-1\' and \''+Date.current.last_month().year().to_s()+'-'+Date.current.last_month().month().to_s()+'-'+Date.current.day().to_s()+'\'').count()
      @cons_mes_actual = Cita.where('"fecha" between \''+Date.current.year().to_s()+'-'+Date.current.month().to_s()+'-1\' and \''+Date.current.year().to_s()+'-'+Date.current.month().to_s()+'-'+Date.current.day().to_s()+'\'').count()
    if @cons_mes_pasado == 0 and @cons_mes_actual > 0 then
      @consultas_mensuales = 100
    end
    if @cons_mes_pasado > 0 and @cons_mes_actual == 0 then
      @consultas_mensuales = -100
    end
    if @cons_mes_pasado != 0 and @cons_mes_actual != 0 then
      @consultas_mensuales = ((100*@cons_mes_actual)/@cons_mes_pasado)-100
    end
      @pac_mes_pasado = Paciente.where('"created_at" between \''+Date.current.last_month().year().to_s()+'-'+Date.current.last_month().month().to_s()+'-1\' and \''+Date.current.last_month().year().to_s()+'-'+Date.current.last_month().month().to_s()+'-'+Date.current.day().to_s()+'\'').count()
      @pac_mes_actual = Paciente.where('"created_at" between \''+Date.current.year().to_s()+'-'+Date.current.month().to_s()+'-1\' and \''+Date.current.tomorrow().to_s()+'\'').count()
    puts @pac_mes_pasado
    puts @pac_mes_actual
    if @pac_mes_pasado == 0 and @pac_mes_actual > 0 then
        @pacientes_mensuales = 100
        end
    if @pac_mes_pasado > 0 and @pac_mes_actual == 0 then
        @pacientes_mensuales = -100
    end
    if @pac_mes_pasado != 0 and @pac_mes_actual != 0 then
        @pacientes_mensuales = ((100*@pac_mes_actual)/@pac_mes_pasado)-100
    end
      @mensajes = Mensaje.select(:mensaje).where('"estado" = FALSE').count()
      @citas = Cita.select(:fecha).where('"fecha" = ?', Date.today()).count()
      @consultas = Historial.all().count()
      @pacientes = Paciente.all().count()
      @citas_pendientes = Cita.where('"fecha" between ? and ?', Date.today(), Date.tomorrow()).order("fecha")
  end

  def index
  end

  def new
    @resume = Admin.new
  end

  def create
  end

  def destroy
  end
end