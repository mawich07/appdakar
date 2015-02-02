class ImagenController < ApplicationController
  def subir
    @img = Imagen.new
    @img.imagen = params[:file]
    @img.save()
    render json: {:link => @img.imagen_url}
  end
end
