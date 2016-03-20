# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever


##ED'S NOTES BELOW!


##we will define how often to run this task in here
##heroku has a scheduler add-on
##https://devcenter.heroku.com/articles/scheduler
##specifically for cron tasks


##we set an error message log for if the cron ever fails to update
##the cron events can overlap if you don't set calculate how long it'll take for the task to complete
##we don't need to worry aobut this, because we're setting the cron task to trigger
##once a day

##update the cron log using the command
##whenever --update-crontab


set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}

every 1.day, :at => '12:00 am' do
  rake "events:fetch"
end
