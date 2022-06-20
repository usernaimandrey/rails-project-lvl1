# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :ModelForm, 'hexlet_code/model_form'
  autoload :View, 'hexlet_code/view'

  class << self
    def form_for(form_data, form_attrs = {})
      model_form = ModelForm.new(form_data, form_attrs)

      yield model_form

      View.render(model_form.form)
    end
  end
end
