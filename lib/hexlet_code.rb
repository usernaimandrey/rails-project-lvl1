# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Error < StandardError; end

  autoload :Tag, 'hexlet_code/tag'
  autoload :Validator, 'hexlet_code/validator'
  autoload :AstBuilder, 'hexlet_code/ast_builder'
  autoload :Render, 'hexlet_code/render'

  class << self
    def form_for(attr_field, attr_form = {})
      ast_builder = AstBuilder.new(attr_form)
      validator = Validator.new(attr_field)

      yield validator

      ast_builder.build(validator.form_data)
      Render.render(ast_builder.root)
    end
  end
end
