class Api::V1::PhotosController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:cities]

	def destroy
		@photo = Photo.find(params[:id])

		@photo.destroy

		@ad = Advertisement.find(params[:ad_id])

		images = Array.new
		@ad.photos.each do |photo|
			images.push({id: photo.id, url: photo.image.url})
		end

		render json: {
			load_ad: {
				title: @ad.title,
				description: @ad.description,
				price: @ad.price,
				purpose: @ad.purpose,
				state: @ad.state,
				category: @ad.category_id,
				location: @ad.city_id,
				images: images 			
			}
		}, status: :ok
	end

end