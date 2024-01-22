module TelSearch
  class ParamParser
    ALLOWED_PARAMETERS = {
      what: "was",
      where: "wo",
      query: "q",
      priv: "privat",
      company: "firma",
      position: "pos",
      max_results: "maxnum",
      language: "lang",
      count_only: "count_only"
    }

    REQUIRED_PARAM = %i[what where]

    def initialize(params)
      @params = params
    end

    def parse
      fetch_valid_params
    end

    private

    def fetch_valid_params
      ALLOWED_PARAMETERS.keys.each_with_object({}) do |key, hash|
        hash[ALLOWED_PARAMETERS[key]] = if @params[key.to_s] || REQUIRED_PARAM.include?(key)
          transform_value(@params[key.to_s] || "")
        end
      end
    end

    def transform_value(value)
      case value
      when true
        "1"
      when false
        "0"
      else
        value
      end
    end
  end
end
