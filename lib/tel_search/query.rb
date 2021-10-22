module TelSearch
  class Query
    def initialize(
      where: nil,
      what: nil,
      query: nil,
      priv: true,
      company: true,
      position: nil,
      max_results: 200,
      language: :en,
      count_only: false
    )

      @where = where
      @what = what
      @query = query
      @priv = priv
      @company = company
      @position = position
      @max_results = max_results
      @language = language
      @count_only = count_only
    end

    def to_h
      instance_variables.each_with_object({}) do |method, hash|
        method_name = method[1..]
        hash[method_name] = instance_variable_get(method)
      end
    end
  end
end
