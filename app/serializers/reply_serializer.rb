class ReplySerializer < ActiveModel::Serializer
  attributes :id, :entry, :user_id, :topic_id, :comment_id
  belongs_to :user
  belongs_to :topic
  belongs_to :comment
end
