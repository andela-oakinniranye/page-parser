require 'nokogiri'
require 'openssl'
require 'open-uri'
require 'open_uri_redirections'

class WebPageParser

  WebPage = Struct.new(:url, :document)
  class UndefinedFetcherError < StandardError; end

  class << self
    def strategies
      @strategies ||= HashWithIndifferentAccess.new
    end

    def fetch(*contents)
      options = contents.extract_options!
      contents.each do |tag|
        raise UndefinedFetcherError.new("Please define a `:with` option to use the fetch macro") unless options[:with]
        strategies[tag] = options[:with].to_s
      end
    end

    def strategy_for(content)
      strategies[content]
    end
  end

  fetch :h1, :h2, :h3, with: 'Fetchers::HeaderFetcher'
  fetch :a, with: 'Fetchers::UrlFetcher'

  attr_reader :url, :raw_document, :parsed_document

  def initialize(url)
    @url = url
  end

  def fetch_page
    @raw_document ||= fetch_document
    @parsed_document ||= parse(@raw_document)
  end

  def get(content)
    strategy = WebPageParser.strategy_for(content)
    return unless strategy && parsed_document

    document = WebPage.new(url, parsed_document)
    strategy.constantize.new(content, document).values
  end

  private
    def fetch_document
      open(url, fetch_options)
    end

    def fetch_options
      { ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, allow_redirections: :safe }
    end

    def parse(document)
      Nokogiri::HTML(document)
    end
end
