class TextSerializer < ActiveModel::Serializer
  attributes :id, :content, :complexity_score, :user_id
end
