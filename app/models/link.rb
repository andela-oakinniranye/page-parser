class Link < ApplicationRecord
  has_many :contents, dependent: :destroy

  validates :url, presence: true, format: { with: URI::regexp }

  after_create :background_index

  def background_index
    PageIndexerJob.perform_later self
  end

end
