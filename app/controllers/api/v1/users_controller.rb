class Api::V1::UsersController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:signup, :signin]

	def signup
		@user = User.new(user_params)

		# for now password and password_confirmation cannot be permitted through the strong params
		@user.password = params[:password]
		@user.password_confirmation = params[:password_confirmation]

		if @user.save
			render json: payload(@user), status: :ok
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
en