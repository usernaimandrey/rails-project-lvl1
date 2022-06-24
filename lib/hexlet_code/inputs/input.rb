# frozen_string_literal: true

module HexletCode
  class Input
    class << self
      def build_tag(data_tag)
        default_attr = { name: nil, type: 'text', value: nil }
        { tag_name: :input, attributes: default_attr.merge(data_tag) }
      end
    end
  end
end
