class Category < ApplicationRecord
	has_many :advertisements, dependent: :destroy
end
