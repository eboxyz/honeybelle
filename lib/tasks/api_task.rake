#http://eewang.github.io/blog/2013/03/12/how-to-schedule-tasks-using-whenever/

##namespace:task is how you call upon the method
##db:migrate is the task to perform, we will be grabbing
##shopify's api and saving it in our own database

##call the rake task by through console using:
##rake events:fetch

namespace :task do
  desc "Rake task to get events data"
  task :fetch => :environment do
    events = Event.nba_search
    events.each do |item|
      item.each do |hash|
        @event = Event.new({
          #code to instantiate an event
          })
        @event.save
      end
    end
    puts "#{Time.now} - Success!"
  end
end
