class Paciente < ActiveRecord::Base
  belongs_to :ciudad
  has_many :telefonos
  has_many :historials
  has_many :citas
  has_many :auth_tokens
end
