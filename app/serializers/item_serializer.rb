class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :belongs_to, :created_at

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end

   def belongs_to
    User.find(object.user_id).name
  end
end
