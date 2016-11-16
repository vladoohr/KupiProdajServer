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
end
