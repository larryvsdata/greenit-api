class TopicSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  has_many :comments
  has_many :replies , through: :comments
  
end
