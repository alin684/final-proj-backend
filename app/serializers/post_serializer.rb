class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :poster_id, :receiver_id, :created_at
end
