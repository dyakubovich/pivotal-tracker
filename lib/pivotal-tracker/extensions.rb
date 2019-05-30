# Happymapper patch for RestClient API Change (response => response.body)

module HappyMapper
  module ClassMethods
    alias_method :orig_parse, :parse
    def parse(xml, options={})
      # binding.pry
      # xml = ActiveSupport::JSON.decode(xml).to_xml if xml.is_a?(RestClient::Response)
      JSON.parse(xml, object_class: OpenStruct)
    end
  end
end
