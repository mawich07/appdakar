class Admin < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :usuario, presence: true # Make sure the owner's name is present.
end
