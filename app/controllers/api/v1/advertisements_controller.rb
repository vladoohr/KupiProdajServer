class Api::V1::AdvertisementsController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:new]
	before_action :find_advertisement, only: [:show, :update]

	def index
		limit = 3
		ads = Array.new
		offset = params[:page].to_i - 1

		@advertisements = Advertisement.search(params[:search], params[:category]).order(updated_at: :desc)

		@advertisements.limit(limit).offset(offset * limit).each do |ad|
			ads.push({
				id: ad.id,
				title: ad.title,
				description: ad.description,
				price: ad.price,
				city: ad.city.name,
				category: ad.category.name,
				image: ad.image.url,
				updated_at: ad.updated_at.strftime("%d-%m-%Y %H:%M")
			})
		end

		render json:{
			ads: @advertisements,
			ads_per_page: ads
		} , status: :ok

	end

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

	def show
		@user =  @ad.user

		render json: {
			load_ad: {
				title: @ad.title,
				description: @ad.description,
				price: @ad.price,
				purpose: @ad.purpose,
				state: @ad.state,
				category: @ad.category_id,
				location: @ad.city_id,
				image: @ad.image.url 			
			},
			ad: {
				id: @ad.id,
				title: @ad.title,
				description: @ad.description,
				price: @ad.price,
				city: @ad.city.name,
				category: @ad.category.name,
				image: @ad.image.url,
				updated_at: @ad.updated_at.strftime("%d-%m-%Y %H:%M")
			},
			user: {
				id: @user.id,
				full_name: @user.full_name,
				phone: @user.phone,
				email: @user.email
			}
		}, status: :ok
	end

	def update
		if @ad.update(ad_params)
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
			params.require(:advertisement).permit(:title, :description, :price, :purpose, :state, :image)
		end

		def find_advertisement
			@ad = Advertisement.find(params[:id])		
		end
end