# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Error < StandardError; end
  autoload :Tag, 'hexlet_code/tag'
  autoload :ModelTag, 'hexlet_code/model_tag'
  autoload :ModelForm, 'hexlet_code/model_form'
  autoload :View, 'hexlet_code/view'

  class << self
    def form_for(attr_field, attr_form = {})
      model_form = ModelForm.new(attr_form)
      model_tag = ModelTag.new(attr_field)

      yield model_tag

      model_form.build(model_tag.form_data)
      View.render(model_form.form)
    end
  end
end
