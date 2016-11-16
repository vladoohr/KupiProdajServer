class City < ApplicationRecord
	has_many :advertisements, dependent: :destroy
end
