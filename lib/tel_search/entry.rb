module TelSearch
  class Entry
    TYPES = {
      person: "Person",
      company: "Organisation"
    }

    ATTRIBUTES = %i[
      canton
      city
      company
      first_name
      last_name
      name
      phone
      street
      street_number
      title
      type
      zip
    ].freeze

    ATTRIBUTE_MAPPING = {
      streetno: [:street_number],
      firstname: [:first_name],
      name: [
        {
          target: :last_name,
          condition: ->(attributes) { attributes[:type]&.first == TYPES[:person] }
        },
        {
          target: :company,
          condition: ->(attributes) { attributes[:type]&.first == TYPES[:company] }
        }
      ]
    }.freeze

    attr_accessor(*ATTRIBUTES)

    def from_rss(feed_entry)
      attributes = collect_tel_information(feed_entry)
      set_attributes(attributes)
      map_attributes(attributes)

      self
    end

    private

    def collect_tel_information(feed_entry)
      feed_entry.xpath("./tel:*").each_with_object(Hash.new { |h, k| h[k] = [] }) do |node, hash|
        hash[node.name.to_sym] << node.text
      end
    end

    def set_attributes(attributes)
      ATTRIBUTES.each do |attribute_name|
        set_property(attribute_name, attributes[attribute_name])
      end
    end

    def map_attributes(attributes)
      ATTRIBUTE_MAPPING.each do |key, mappings|
        next if key.nil? || mappings.nil?

        node_value = attributes[key]

        mappings.each do |mapping|
          case mapping
          when Symbol
            set_property(mapping, node_value)
          when Hash
            condition = mapping[:condition]

            set_property(mapping[:target], node_value) if condition.call(attributes)
          end
        end
      end
    end

    def set_property(prop_name, prop_value)
      return if prop_value.nil?

      send("#{prop_name}=", prop_value.count > 1 ? prop_value : prop_value.first)
    end
  end
end
