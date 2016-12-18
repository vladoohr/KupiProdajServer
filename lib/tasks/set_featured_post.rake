desc "This task is called by the Heroku scheduler add-on"
task :set_featured_ad => :environment do
	puts "Updating advertisements..."
	AppWorker.perform_async()
	puts "DONE!!!"
end