class User < ApplicationRecord
    validates :name, presence:true, length: {minimum:3, maximum:30}
    validates :email, presence:true, length: { maximum:255 }, 
                format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i},
                uniqueness: true        
    has_secure_password
    validates :password, presence: true, length: { minimum:8 }, unless: Proc.new { |user| user.password.blank? }
    mount_uploader :image, ImageUploader
    has_many :posts
    has_many :products
    has_many :favorites, dependent: :destroy
    has_many :favorites_posts, through: :favorites, source: :post
end
