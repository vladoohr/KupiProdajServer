class HomeController < ApplicationController
	def index
		redirect_to "http://localhost:8080/"
	end
end