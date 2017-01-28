class Content < ApplicationRecord
  belongs_to :link

  enum tag: {
    h1: 'h1',
    h2: 'h2',
    h3: 'h3',
    url: 'a'
  }

  validates :body, :tag, presence: true
  validates :body, format: { with: URI::regexp }, if: :url?

  before_save :clean_body

  def clean_body
    # we don't want to save carriage returns in our db
    self.body = body.squish
  end
end
