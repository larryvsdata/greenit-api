class Topic < ApplicationRecord
  has_many :comments
  has_many :replies , through: :comments

end
