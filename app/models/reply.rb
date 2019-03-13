class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  belongs_to :comment
end
