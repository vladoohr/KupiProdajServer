class User < ApplicationRecord
  has_many :advertisements, dependent: :destroy

	before_save { self.email = email.downcase }

	validates :full_name, presence: { message: 'Име е задолжително поле' },
												length: { minimum: 3, maximum: 50, message: 'Името може да содржи минимум 3, максимум 50 карактери' }

	VALID_EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  validates :email, presence: { message: 'Е-маил е задолжително поле' },
                    format: { with: VALID_EMAIL_REGEX, message: 'Невалидна е-маил адреса' },
                    uniqueness: { case_sensitive: false, message: 'Е-маил адресата е веќе земена' }

  VALID_PHONE_REGEX = /\A\+?[0-9]{8,14}\z/i                  
  validates :phone, presence: { message: 'Телефон е задолжително поле' },
  									format: { with: VALID_PHONE_REGEX, message: 'Невалиден телефонскиот број' },
  									numericality: { message: 'Телефонскиот број може да содржи само бројки 0-9 и + на почетокот' }

	has_secure_password
	validates :password, presence: { message: 'Лозинка е задолжително поле' },
											 length: { minimum: 6, message: 'Лозинка мора да има минимум 6 карактери' }
	validates :password_confirmation, presence: { message: 'Потврди лозинка е задолжително поле' },
											 							length: { minimum: 6, message: 'Потврди лозинка мора да има минимум 6 карактери' }

  validate :confirm_password					 							

  private
 	def confirm_password
 		if self.password != self.password_confirmation
 			errors.add(:password_confirmation, 'Лозинките мора да се совпаѓаат')
 		end
  end

end
