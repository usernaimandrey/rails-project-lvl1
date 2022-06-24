# frozen_string_literal: true

module HexletCode
  class DataCollector
    attr_accessor :form_data

    attr_reader :attributes

    def initialize(attributes)
      @attributes = attributes
      @form_data = []
    end

    def input(attr_name, options = {})
      value = attributes.public_send(attr_name)
      form_data << { name: attr_name,  value: value }.merge(options)
    end

    def submit(value = 'Save', options = {})
      form_data << { value: value, as: :submit }.merge(options)
    end
  end
end
