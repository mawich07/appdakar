namespace :notificar do
  desc "Run monthly report"
  task :montly_report => :environment do
    @cita = Cita.new
    @cita.hora = "15:30"
    @cita.save()
  end
end
