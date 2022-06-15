# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  def setup
    constant_user = Struct.new(:name, :job, :gender, keyword_init: true)
    @user = constant_user.new name: 'rob', job: 'hexlet', gender: 'm'
    @form1 = load_fixtures('form1.html')
    @form2 = load_fixtures('form2.html')
  end

  def test_empty_form
    expected = %(<form action="#" method="post">\n</form>)
    html = HexletCode.form_for @user do |f|
      f
    end
    assert_equal(expected, html)
  end

  def test_empty_form_with_url
    expected = %(<form action="/users" method="post">\n</form>)
    html = HexletCode.form_for @user, url: '/users' do |f|
      f
    end
    assert_equal(expected, html)
  end

  def test_create_with_field
    html = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text
    end
    assert_equal(@form1, html)
  end

  def test_with_url
    html = HexletCode.form_for @user, url: '/users' do |f|
      f.input :name
      f.input :job, as: :text
      f.input :gender
    end
    assert_equal(@form2, html)
  end
end
