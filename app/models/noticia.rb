class Noticia < ActiveRecord::Base
  mount_uploader :imagen, AttachmentUploader # Tells rails to use this uploader for this model.
  belongs_to :administrador
end