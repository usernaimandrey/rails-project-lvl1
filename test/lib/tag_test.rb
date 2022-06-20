# frozen_string_literal: true

require 'test_helper'

class TagTest < Minitest::Test
  def test_singl_tag
    expected = '<br>'
    tag = HexletCode::Tag.build(:br) { 'blabla' }
    assert_equal(expected, tag)
  end

  def test_singl_tag_with_attrib
    expected = '<input type="submit" value="Save">'
    tag = HexletCode::Tag.build(:input, type: 'submit', value: 'Save')
    assert_equal(expected, tag)
  end

  def test_double_tag_with_content
    expected = '<label>Email</label>'
    tag = HexletCode::Tag.build(:label) { 'Email' }
    assert_equal(expected, tag)
  end

  def test_double_with_content_attrib
    expected = '<label for="email">Email</label>'
    tag = HexletCode::Tag.build(:label, for: 'email') { 'Email' }
    assert_equal(expected, tag)
  end

  def test_double_tag
    expected = '<div></div>'
    tag = HexletCode::Tag.build('div')
    assert_equal(expected, tag)
  end
end
