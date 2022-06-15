# frozen_string_literal: true

module HexletCode
  class AstBuilder
    attr_accessor :root

    def initialize(attr_form)
      @root = {
        tag_name: 'form',
        attributes: { action: attr_form[:url] || '#', method: 'post' },
        body: nil,
        children: []
      }
    end

    def build(form_data)
      form_data.each do |k, v|
        tag_name = v[:options].fetch(:as, :input)
        case tag_name
        when :input then root[:children] << input(k, v[:value])
        when :text then root[:children] << textarea(k, v[:value])
        else puts "Unknow tag name: #{tag_name}"
        end
      end
    end

    def input(name, value)
      {
        tag_name: 'input',
        attributes: { name: name, type: 'text', value: value },
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
  end
end
