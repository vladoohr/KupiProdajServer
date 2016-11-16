class Api::V1::AdvertisementsController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:new]

	def new
		@ad = Advertisement.new(ad_params)
		@ad.user_id = params[:user]
		@ad.city_id = params[:location]
		@ad.category_id = params[:category]


		if @ad.save
			render json: {message: "Успешно додаден оглас!"}, status: :ok
		else
			# pass only error messages
			@errors = Array.new
			@ad.errors.each do |attribute, error|
				@errors.push(error)
			end

			render json: {errors: @errors}, status: :bad_content
		end
	end

	private
	def ad_params
		params.require(:advertisement).permit(:title, :description, :price, :purpose, :state)
	end

end