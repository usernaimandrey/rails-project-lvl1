# frozen_string_literal: true

module HexletCode
  class ModelForm
    attr_accessor :form

    attr_reader :default, :form_data

    def initialize(form_attrs)
      @form = {
        tag_name: :form,
        attributes: { action: form_attrs[:url] || '#', method: 'post' }.merge(form_attrs.except(:url)),
        body: nil,
        children: []
      }
    end

    def build_model(form_data)
      form_data.each do |t|
        type_tag = t.fetch(:as, :input).to_s.capitalize
        object = Object.const_get "HexletCode::#{type_tag}"
        form[:children] << HexletCode::Label.build_tag(t[:name]) if type_tag != 'Submit'
        form[:children] << object.build_tag(t)
      end
    end
  end
end
