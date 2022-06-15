# frozen_string_literal: true

module HexletCode
  class Validator
    attr_accessor :form_data

    attr_reader :attributes_field

    def initialize(attr_field)
      @attr_field = attr_field
      @form_data = {}
    end

    def input(attr_name, options = {})
      value = @attr_field.public_send(attr_name)
      form_data[attr_name] = { value: value, options: options }
    end
  end
end
