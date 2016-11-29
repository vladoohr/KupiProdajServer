class Advertisement < ApplicationRecord
	has_many :photos, dependent: :destroy
	belongs_to :category
	belongs_to :user
	belongs_to :city

	before_save {self.title = title.capitalize}

	validates :title, presence: {message: 'Наслов е задолжително поле!'},
										length: {maximum: 75, message: 'Насловот може да содржи максимум 75 карактери'}

	validates :description, presence: {message: 'Описот е задолжително поле!'},
													length: {maximum: 500, message: 'Описот може да содржи максимум 500 карактери'}

	validates :price, numericality: {message: "Цената може да содржи само бројки!"},
										allow_nil: true

	mount_base64_uploader :image, ImageUploader

	validate :image_size_validation
 
	private
	  def image_size_validation
	    errors[:image] << "Сликата треба да биде помала од 3000KB" if image.size > 3.megabytes
	  end
end
