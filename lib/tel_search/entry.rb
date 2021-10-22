module TelSearch
  class Entry
    ATTRIBUTES = %i[title type name first_name last_name street street_number zip city canton phone]

    ATTRIBUTE_MAPPING = {
      streetno: :street_number
    }

    attr_accessor(*ATTRIBUTES)

    def from_rss(feed_entry)
      attributes = collect_tel_information(feed_entry)
      set_attributes(attributes)

      self
    end

    private

    def set_attributes(attributes)
      ATTRIBUTES.each do |attribute_name|
        set_property(attribute_name, attributes[attribute_name])
      end
    end

    def collect_tel_information(feed_entry)
      feed_entry.xpath("./tel:*").each_with_object(Hash.new { |h, k| h[k] = [] }) do |node, hash|
        custom_key = ATTRIBUTE_MAPPING[node.name.to_sym]
        node_name = custom_key || node.name.to_sym
        hash[node_name] << node.text
      end
    end

    def set_property(prop_name, prop_value)
      send("#{prop_name}=", prop_value.count > 1 ? prop_value : prop_value.first)
    end
  end
end
