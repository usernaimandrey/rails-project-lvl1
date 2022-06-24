# frozen_string_literal: true

require 'test_helper'

class TagTest < Minitest::Test
  def test_singl_tag
    expected = '<br>'
    tag = HexletCode::Tag.build(:br) { 'blabla' }
    assert_equal(expected, tag)
  end
end
