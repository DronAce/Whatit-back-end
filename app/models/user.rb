class User < ApplicationRecord
    has_secure_password
    has_many :followers, foreign_key: :follower_id, class_name: 'Follow'
    has_many :followees, through: :followers
    has_many :followees, foreign_key: :followee_id, class_name: 'Follow'
    has_many :followers, through: :followees
    has_many :memberships
    has_many :communities, through: :memberships
    has_many :posts, dependent: :destroy
    has_many :comments


    
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true
    validates :name, presence: true
end
