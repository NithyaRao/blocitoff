class UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :created_at
   
  has_many :items, key: :ToDoList

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
