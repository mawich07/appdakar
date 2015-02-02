class TipoSangreController < ApplicationController

    def index
      if session[:usuario] == nil then
        render :'app_principal/login'
        return
      end
      @titulo = "Gestión de Tipos de Sangre"
      @tipos = TipoSangre.all().order("tipo")
      @datos_activo = 'active open'
      @tiposangre_activo = 'active'
    end

    def editar
      if session[:usuario] == nil then
        render :'app_principal/login'
        return
      end
      @tipo = TipoSangre.find(params[:idtiposangre])
      @tipo.tipo = params[:tiposangre]
      @tipo.save()

      @titulo = "Gestión de Tipos de Sangre"
      @tipos = TipoSangre.all().order("tipo")
      @notifeditar = true
      @datos_activo = 'active open'
      @tiposangre_activo = 'active'
      render :index
    end

    def nuevo
      if session[:usuario] == nil then
        render :'app_principal/login'
        return
      end
      @long = params[:tiposangre].length-1
      for i in 0..@long
        @tipo = TipoSangre.new({"tipo"=>params[:tiposangre][i]})
        @tipo.save()
      end
      @notifnuevo = true
      @titulo = "Gestión de Tipos de Sangre"
      @tipos = TipoSangre.all().order("tipo")
      @datos_activo = 'active open'
      @tiposangre_activo = 'active'
      render :index
    end

    def eliminar
      if session[:usuario] == nil then
        render :'app_principal/login'
        return
      end
      @tipo = TipoSangre.find(params[:idtipo])
      @tipo.delete()
      @notifeliminar = true
      @titulo = "Gestión de Tipos de Sangre"
      @tipos = TipoSangre.all().order("tipo")
      @datos_activo = 'active open'
      @tiposangre_activo = 'active'
      render :index
    end

end