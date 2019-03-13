class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :admin
  has_many :comments
  has_many :replies 
end
