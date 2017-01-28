class ErrorSerializer < ActiveModel::Serializer
  attributes :message

  def message
    object
  end

  def root
    "errors"
  end
end
