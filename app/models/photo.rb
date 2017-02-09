class Photo < ApplicationRecord
	belongs_to :advertisement
	mount_base64_uploader :image, ImageUploader

	validate :image_size_validation

	private
	  def image_size_validation
	    errors[:image] << "Сликата треба да биде помала од 3000KB" if image.size > 3.megabytes
	  end

end
