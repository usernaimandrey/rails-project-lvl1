# frozen_string_literal: true

module HexletCode
  class ModelTag
    attr_accessor :form_data

    attr_reader :attributes_field

    def initialize(attr_field)
      @attr_field = attr_field
      @form_data = []
    end

    def input(attr_name, options = {})
      value = @attr_field.public_send(attr_name)
      input_type = options.fetch(:as, :input)
      case input_type
      when :input
        form_data << { tag_name: :input, input_type: input_type,
                       attributes: { name: attr_name, value: value }.merge(options) }
      when :text
        form_data << { tag_name: :textarea, input_type: input_type, body: value,
                       attributes: { name: attr_name }.merge(options.reject { |k, _v| k == :as }) }
      else "Unknow input type: #{input_type}"
      end
    end

    def submit(attr_name = 'Save', options = {})
      form_data << { tag_name: :input, input_type: :submit,
                     attributes: { value: attr_name }.merge(options) }
    end
  end
end
