class Api::V1::ItemsController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:cities]

	def cities
		@cities = City.all

		render json: {cities: @cities}, status: :ok
	end

	def categories
		@categories = Category.all

		render json: {categories: @categories}, status: :ok
	end
end