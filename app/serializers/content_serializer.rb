class ContentSerializer < ActiveModel::Serializer
  attributes :id, :tag, :body

  belongs_to :link
end
