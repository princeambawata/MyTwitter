class Tweet < ApplicationRecord
	belongs_to :user
	has_many :likes,dependent: :destroy
	validates  :tweet, presence: true
	mount_uploader :image, ImageUploader
	mount_uploader :video, ImageUploader
end
