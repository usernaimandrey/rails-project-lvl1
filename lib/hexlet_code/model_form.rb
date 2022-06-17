# frozen_string_literal: true

module HexletCode
  class ModelForm
    attr_accessor :form

    attr_reader :default

    def initialize(attr_form)
      @form = {
        tag_name: :form,
        attributes: { action: attr_form[:url] || '#', method: 'post' },
        body: nil,
        children: []
      }

      @default = {
        input: { name: nil, type: 'text', value: nil },
        submit: { name: 'commit', type: 'submit', value: nil },
        text: { cols: 20, rows: 40, name: nil }
      }
    end

    def build(form_data)
      form_data.each do |t|
        tag_name, input_type, attributes, body = t.values_at(:tag_name, :input_type, :attributes, :body)
        new_attributes = default[input_type].merge(attributes)
        form[:children] << label(new_attributes[:name]) if input_type != :submit
        form[:children] << { tag_name: tag_name, attributes: new_attributes, body: body }
      end
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
