class Post < ApplicationRecord
    belongs_to :user
    belongs_to :community, optional: true

    has_many :comments, dependent: :destroy
    has_many :likes

    validates :content, presence: true
    validates :user_id, presence: true
end
