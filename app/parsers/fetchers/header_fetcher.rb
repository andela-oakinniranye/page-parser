module Fetchers
  class HeaderFetcher < BasicTagFetcher

    def values
      matches.reduce([]) do |collector, value|
        collector.push(value.text) unless value.blank?
        collector
      end
    end
  end
end
