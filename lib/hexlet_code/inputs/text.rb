# frozen_string_literal: true

module HexletCode
  class Text
    class << self
      def build_tag(data_tag)
        default_attr = { cols: 20, rows: 40, name: nil }
        { tag_name: :textarea, body: data_tag[:value],
          attributes: default_attr.merge(data_tag.except(:as).except(:value)) }
      end
    end
  end
end
