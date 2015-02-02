class Imagen < ActiveRecord::Base
  mount_uploader :imagen, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :imagen, presence: true # Make sure the owner's name is present.
end
