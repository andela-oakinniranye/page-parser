module Fetchers
  class BasicTagFetcher
    attr_reader :type, :webpage
    delegate :document, to: :webpage

    def initialize(type, webpage)
      @type = type
      @webpage = webpage
    end

    def matches
      return unless document
      document.xpath("//#{type}")
    end

    def values
      matches
    end
  end
end
