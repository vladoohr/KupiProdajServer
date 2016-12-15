class HomeController < ApplicationController
	def index
		# redirect_to "https://advertisementsclient.herokuapp.com/?page=1"
		AppWorker.perform_async()

		render plain: "WORKER STARTS WORKING :)"
	end
end