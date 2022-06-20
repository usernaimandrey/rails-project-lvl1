# frozen_string_literal: true

module HexletCode
  class ModelForm
    attr_accessor :form

    attr_reader :default, :form_data

    def initialize(form_data, form_attrs)
      @form_data = form_data
      @form = {
        tag_name: :form,
        attributes: { action: form_attrs[:url] || '#', method: 'post' }.merge(form_attrs.except(:url)),
        body: nil,
        children: []
      }

      @default = {
        input: { name: nil, type: 'text', value: nil },
        submit: { name: 'commit', type: 'submit', value: nil },
        text: { cols: 20, rows: 40, name: nil }
      }
    end

    def input(attr_name, options = {})
      value = form_data.public_send(attr_name)
      input_type = options.fetch(:as, :input)
      case input_type
      when :input
        add_tag({ tag_name: :input, input_type: input_type,
                  attributes: { name: attr_name, value: value }.merge(options) })
      when :text
        add_tag({ tag_name: :textarea, input_type: input_type, body: value,
                  attributes: { name: attr_name }.merge(options.except(:as)) })
      else "Unknow input type: #{input_type}"
      end
    end

    def submit(attr_name = 'Save', options = {})
      add_tag({ tag_name: :input, input_type: :submit,
                attributes: { value: attr_name }.merge(options) })
    end

    protected

    def add_tag(data_tag)
      tag_name, input_type, attributes, body = data_tag.values_at(:tag_name, :input_type, :attributes, :body)
      new_attributes = default[input_type].merge(attributes)
      form[:children] << label(new_attributes[:name]) if input_type != :submit
      form[:children] << { tag_name: tag_name, attributes: new_attributes, body: body }
    end

    def label(name)
      {
        tag_name: 'label',
        attributes: { for: name },
        body: name.capitalize,
        children: []
      }
    end
  end
end
