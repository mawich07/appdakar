class SesionController < ApplicationController
  def new
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @admin = Administrador.find_by({"usuario" => params[:usuario], "password" => params[:password]})
    if @admin then
      session[:usuario] = @admin.id
      session[:nombres] = @admin.nombres + " " + @admin.apellidos

      @usuario = session[:nombres]
      @titulo = 'Panel De Control'
      @panel_activo = 'active'
      render :'admin/panel'
    end
  end

  def logout

  end
end
