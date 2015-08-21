class ItemSerializer < ActiveModel::Serializer
  attributes :name, :created_at
  has_one :user

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end

  
end
