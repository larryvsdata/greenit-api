class CommentSerializer < ActiveModel::Serializer
  attributes :id, :entry, :user_id, :topic_id
  belongs_to :user
  belongs_to :topic
  has_many :replies
end
