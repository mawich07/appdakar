class Ciudad < ActiveRecord::Base
  has_many :pacientes
end
