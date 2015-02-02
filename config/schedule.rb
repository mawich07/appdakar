# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
set :environment, "development"
set :job_template, "/bin/bash -i -c ':job'"
set :output, {:error => "log/error.log", :standard => "log/cron.log"}
# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
every 1.minute do
  rake "notificar:montly_report", environment => "development"
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
