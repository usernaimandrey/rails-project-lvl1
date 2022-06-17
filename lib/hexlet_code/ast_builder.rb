# frozen_string_literal: true

module HexletCode
  class AstBuilder
    attr_accessor :form

    def initialize(attr_form)
      @form = {
        tag_name: 'form',
        attributes: { action: attr_form[:url] || '#', method: 'post' },
        body: nil,
        children: []
      }
    end

    def build(form_data)
      form_data.each do |name, v|
        tag_name = v[:options].fetch(:as, :input)
        case tag_name
        when :input
          form[:children] << label(name)
          form[:children] << input(name: name, value: v[:value])
        when :text then form[:children] << textarea(name, v[:value])
        when :submit then form[:children] << input(name: 'commit', type: 'submit', value: v[:value])
        else puts "Unknow tag name: #{tag_name}"
        end
      end
    end

    def input(attributes)
      {
        tag_name: 'input',
        attributes: { name: nil, type: 'text', value: nil }.merge(attributes),
        body: nil,
        children: []
      }
    end

    def textarea(name, body)
      {
        tag_name: 'textarea',
        attributes: { cols: 20, rows: 40, name: name },
        body: body,
        children: []
      }
    end

    def label(input_name)
      {
        tag_name: 'label',
        attributes: { for: input_name },
        body: input_name.capitalize,
        children: []
      }
    end
  end
end
