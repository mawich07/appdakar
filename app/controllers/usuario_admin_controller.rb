class UsuarioAdminController < ApplicationController
  def index
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
  end

  def new
    if session[:usuario] == nil then
      render :'app_principal/login'
      return
    end
    @resume = Historial.new
  end

  def create
  end

  def destroy
  end
end
