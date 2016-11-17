class Photo < ApplicationRecord
	belongs_to :advertisement
	mount_uploader :image, ImageUploader
end
