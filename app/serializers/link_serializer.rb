class LinkSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :url, :completed, :_meta
  has_many :contents, if: :include_contents?

  def completed
    object.completed_at.present?
  end

  def _meta
    {
      self: link_path(object)
    }
  end

  def include_contents?
    if instance_options.has_key?(:include_contents)
      instance_options[:include_contents] == true
    else
      true
    end
  end
end
