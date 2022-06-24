# frozen_string_literal: true

module HexletCode
  class Submit
    class << self
      def build_tag(data_tag)
        default_attr = { name: 'commit', type: 'submit', value: nil }
        { tag_name: :input, attributes: default_attr.merge(data_tag.except(:as)) }
      end
    end
  end
end
