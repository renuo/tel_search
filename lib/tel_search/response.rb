require "nokogiri"

module TelSearch
  class Response
    attr_accessor :entries

    def initialize(response)
      @response = response
      @entries = []
    end

    def self.build_from_response(response)
      tel_response = new(response)
      tel_response.parse
      tel_response
    end

    def parse
      feed = parse_rss
      self.entries = convert_to_entries(feed)
    end

    private

    def convert_to_entries(feed)
      feed.search("entry").map do |entry|
        Entry.new.from_rss(entry)
      end
    end

    def parse_rss
      Nokogiri.XML(@response.body)
    end
  end
end
