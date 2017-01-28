class IndexingService
  attr_reader :parser, :link

  def initialize(link, parser: nil)
    @link = link
    @parser = parser || WebPageParser.new(link.url)
  end

  def index_content!
    preindex_setup

    Link.transaction do
      Content.tags.values.each do |tag|
        find_and_index(tag)
      end
      link.completed_at = Time.zone.now
      link.save
    end
  end

  private
    def preindex_setup
      parser.fetch_page
    end

    def find_and_index(tag)
      values = parser.get(tag)
      values.each do |body|
        create_content(tag, body)
      end
    end

    def create_content(tag, body)
      Content.create(tag: tag, body: body, link: link)
    end
end
