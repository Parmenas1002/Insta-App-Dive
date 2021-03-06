class Post < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user
    has_many :favorites, dependent: :destroy
    has_many :favorites_users, through: :favorites, source: :user
end
