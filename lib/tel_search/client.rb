require "uri"
require "net/http"

module TelSearch
  class Client
    BASE_URL = "https://tel.search.ch"
    API_KEY_NAME = :key
    BASE_PATH = "api/"

    def initialize(api_key, base_path: BASE_URL)
      @api_key = api_key
      @base_uri = base_path
    end

    def execute(query)
      params_for_request = request_params(query.to_h)
      parse_response(send_request(params_for_request))
    end

    private

    def request_params(parameters)
      TelSearch::ParamParser.new(parameters.to_h).parse.compact.merge(
        API_KEY_NAME => @api_key
      )
    end

    def send_request(params)
      url = build_url
      url.query = URI.encode_www_form(params)
      req = Net::HTTP::Get.new(url)
      Net::HTTP.start(url.hostname, url.port, use_ssl: true) do |http|
        http.request(req)
      end
    end

    def build_url
      uri = @base_uri.dup
      uri << "/" unless uri.end_with? "/"
      URI.join(URI.parse(uri), BASE_PATH)
    end

    def parse_response(response)
      TelSearch::Response.build_from_response(response)
    end
  end
end
