module Fetchers
  class UrlFetcher < BasicTagFetcher

    def values
      matches.reduce([]) do |collector, anchor|
        href = anchor.attr('href')
        collector.push(url_for(href)) if valid_url?(href)
        collector
      end
    end

    def url_for(href)
      URI.join(webpage.url, href)
    end

    def valid_url?(href)
      href.present? && URI::parse(href)
    rescue
      false
    end
  end
end
