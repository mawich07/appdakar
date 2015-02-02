class Historial < ActiveRecord::Base
  scope :entre_fechas, ->(desde,hasta) {
    select(:fecha).where('"fecha" between ? and ?', desde, hasta).group("fecha").order("fecha").count()
  }
  scope :entre_fechas_pat, ->(desde,hasta, patologia) {
    select(:fecha).where('"patologia_id" = ? and "fecha" between ? and ?', patologia, desde, hasta).group("fecha").order("fecha").count()
  }
  belongs_to :paciente
  belongs_to :patologia
end
