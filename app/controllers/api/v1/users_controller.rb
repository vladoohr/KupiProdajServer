class Api::V1::UsersController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:signup, :signin]

	def signup
		@user = User.new(user_params)

		# for now password and password_confirmation cannot be permitted through the strong params
		@user.password = params[:password]
		@user.password_confirmation = params[:password_confirmation]

		if @user.save
			render json: payload(@user), status: :ok

			# Tell the UserMailer to send a welcome email after save
			UserMailer.welcome_email(@user).deliver_now
		else 
			# pass only error messages
			@errors = Array.new
			@user.errors.each do |attribute, error|
				@errors.push(error)
			end

			render json: { errors: @errors }, status: :bad_request
		end
	end

	def signin
		@user = User.find_by email: user_params[:email]

		# create session only if user is admin form RailsAdmin
		session[:user_id] = @user.id if @user.admin

		if @user && @user.authenticate(params[:password])
			render json: payload(@user)
		else 
			render json: { errors: ['Погрешен Е-маил/Лозинка'] }, status: :unauthorized
		end
	end

	def user_ads
		@user = User.find(params[:id])
		@user_ads = Array.new
		limit = 3
		offset = params[:page].to_i - 1

		@user.advertisements.order(updated_at: :desc).limit(limit).offset(offset * limit).each do |ad|
			@user_ads.push({
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
			user_ads_per_page: @user_ads,
			user_ads: @user.advertisements
		} , status: :ok
	end

	private 
	def user_params
		params.require(:user).permit(:full_name, :phone, :email)
	end

	def payload(user)
    return nil unless user and user.id
    {
      auth_token: JsonWebToken.encode({ user_id: user.id }),
      user: { id: user.id, full_name: user.full_name, email: user.email, phone: user.phone }
    }
  end
end