# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Error < StandardError; end

  autoload :Tag, 'hexlet_code/tag'

  class << self
    def form_for(_data, attributes = {})
      current_attributes = { action: attributes[:url] || '#', method: 'post' }
      Tag.build('form', current_attributes) { '\n' }
    end
  end
end
