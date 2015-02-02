class Administrador < ActiveRecord::Base
  mount_uploader :avatar, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :usuario, presence: true # Make sure the owner's name is present.
  after_initialize :init

  def init
    self.es_super_usuario = false if self.es_super_usuario.nil?
  end
end