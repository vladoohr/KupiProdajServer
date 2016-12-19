class UserMailer < ApplicationMailer
	def welcome_email(user)
		@user = user
		mail(to: @user.email, subject: 'Добредојдовте на KupoProdaj.mk')
	end
end
