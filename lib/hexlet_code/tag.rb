# frozen_string_literal: true

module HexletCode
  class Tag
    class << self
      def build(tag_name, attributes = {})
        content = yield if block_given?
        formated_attributes = attributes.to_a.map do |tag|
          k, v = tag
          %( #{k}="#{v}")
        end
        close = single?(tag_name) ? nil : %(</#{tag_name}>)
        %(<#{tag_name}#{formated_attributes.join()}>#{content}#{close})
      end

      def single?(tag_name)
        single_tags = %w[br hr img input link]
        single_tags.include?(tag_name)
      end
    end
  end
end