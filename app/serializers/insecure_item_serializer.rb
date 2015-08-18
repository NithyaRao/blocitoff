class InsecureUserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password, :name

end