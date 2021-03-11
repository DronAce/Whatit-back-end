class Community < ApplicationRecord
    has_many :memberships
    has_many :users, through: :memberships
    has_many :posts

    validates :name, presence: true
end
