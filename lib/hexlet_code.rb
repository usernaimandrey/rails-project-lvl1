# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :DataCollector, 'hexlet_code/data_collector'
  autoload :Input, 'hexlet_code/tags/input'
  autoload :ModelForm, 'hexlet_code/model_form'
  autoload :Label, 'hexlet_code/tags/label'
  autoload :Submit, 'hexlet_code/tags/submit'
  autoload :Tag, 'hexlet_code/tag'
  autoload :Text, 'hexlet_code/tags/text'

  class << self
    def form_for(attributes, form_attrs = {})
      collector = DataCollector.new(attributes)
      model_form = ModelForm.new(form_attrs)

      yield collector

      model_form.render(collector.form_data)
    end
  end
end
