class HomeController < ApplicationController
	def index
		redirect_to "https://advertisementsclient.herokuapp.com/?page=1"
	end
end