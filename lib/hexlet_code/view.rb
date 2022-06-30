# frozen_string_literal: true

module HexletCode
  class View
    attr_reader :form

    def initialize(form_attrs)
      @form = {
        tag_name: :form,
        attributes: { action: form_attrs[:url] || '#', method: 'post' }.merge(form_attrs.except(:url)),
        body: nil
      }
    end

    def render(form_data)
      content = form_data.reduce('') do |acc, t|
        type_tag = t.fetch(:as, :input).to_s.capitalize
        class_name = Object.const_get "HexletCode::#{type_tag}"
        label, input = class_name.build_tag(t)

        "#{acc}#{render_tag(label)}#{render_tag(input)}"
      end
      (HexletCode::Tag.build(form[:tag_name], form[:attributes]) { "#{content}\n" }).to_s
    end

    def render_tag(tag, replacer = ' ', count = 2)
      return nil if tag.empty?

      "\n#{replacer * count}#{HexletCode::Tag.build(tag[:tag_name], tag[:attributes]) do
                                tag[:body]
                              end }"
    end
  end
end
