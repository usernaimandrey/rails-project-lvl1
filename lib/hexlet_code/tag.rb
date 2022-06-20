# frozen_string_literal: true

module HexletCode
  class Tag
    class << self
      def build(tag_name, attributes = {})
        content = yield if block_given? && !single?(tag_name)
        formated_attributes = []
        attributes.each do |k, v|
          formated_attributes << %( #{k}="#{v}") if v
        end
        close_tag = single?(tag_name) ? nil : "</#{tag_name}>"
        "<#{tag_name}#{formated_attributes.join}>#{content}#{close_tag}"
      end

      def single?(tag_name)
        single_tags = %i[br hr img input link]
        single_tags.include?(tag_name)
      end
    end
  end
end
