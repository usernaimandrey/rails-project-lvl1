# frozen_string_literal: true

module HexletCode
  class View
    class << self
      def render(ast, replacer = ' ', count = 2)
        tag_name, attributes, children = ast.values_at(:tag_name, :attributes, :children)

        content = children.reduce('') do |acc, t|
          "#{acc}\n#{replacer * count}#{HexletCode::Tag.build(t[:tag_name], t[:attributes]) do
                                          t[:body]
                                        end }"
        end
        (HexletCode::Tag.build(tag_name, attributes) { "#{content}\n" }).to_s
      end
    end
  end
end
