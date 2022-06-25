# frozen_string_literal: true

module HexletCode
  class Label
    class << self
      def build_tag(name)
        {
          tag_name: 'label',
          attributes: { for: name },
          body: name.capitalize,
          children: []
        }
      end
    end
  end
end
