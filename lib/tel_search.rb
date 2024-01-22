# frozen_string_literal: true

require_relative "tel_search/client"
require_relative "tel_search/entry"
require_relative "tel_search/param_parser"
require_relative "tel_search/query"
require_relative "tel_search/response"
require_relative "tel_search/version"

module TelSearch
  class Error < StandardError
    attr_reader :response

    def initialize(response)
      super(response.body)
      @response = response
    end
  end
end
