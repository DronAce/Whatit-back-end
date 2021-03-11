class WatchListSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :post_id, :name
end
