class PhotosController < ApplicationController
	
	def new
		@photo = Photo.new 
	end

	def create
		binding.pry
		@photo = Photo.new(photo_params)

		@photo.save
	end

	def show
		@photo = Photo.find(params[:id])
	end

	private
		def photo_params
			params.require(:photo).permit(:image)
		end
end