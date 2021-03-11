class Comment < ApplicationRecord
    belongs_to :user 
    belongs_to :post

    has_many :likes

    validates :text, presence: true
    validates :user_id, presence: true
    validates :post_id, presence: true
end
