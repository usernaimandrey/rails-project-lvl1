# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :ModelForm, 'hexlet_code/model_form'
  autoload :View, 'hexlet_code/view'
  autoload :DataCollector, 'hexlet_code/data_collector'
  autoload :Input, 'hexlet_code/tags/input'
  autoload :Text, 'hexlet_code/tags/text'
  autoload :Submit, 'hexlet_code/tags/submit'
  autoload :Label, 'hexlet_code/tags/label'

  class << self
    def form_for(attributes, form_attrs = {})
      collector = DataCollector.new(attributes)
      model_form = ModelForm.new(form_attrs)

      yield collector

      model_form.build_model(collector.form_data)
      View.render(model_form.form)
    end
  end
end
