class Photo < ApplicationRecord
	belongs_to :advertisement
	mount_base64_uploader :image, ImageUploader
end
