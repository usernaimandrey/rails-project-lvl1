# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  def setup
    constant_user = Struct.new(:name, :job, :gender, keyword_init: true)
    @user1 = constant_user.new name: 'rob', job: 'hexlet', gender: 'm'
    @user2 = constant_user.new job: 'hexlet'
  end

  def test_default_attr
    expected = load_fixtures('form1.html')
    html = HexletCode.form_for @user1 do |f|
      f.input :name
      f.input :job, as: :text
      f.submit
    end
    assert_equal(expected, html)
  end

  def test_custom_attr
    expected = load_fixtures('form2.html')
    html = HexletCode.form_for @user1, url: '/users' do |f|
      f.input :name, class: 'user-input'
      f.input :job, as: :text, rows: 50, cols: 50
      f.submit
    end
    assert_equal(expected, html)
  end

  def test_create_custom_submit
    expected = load_fixtures('form3.html')
    html = HexletCode.form_for @user2 do |f|
      f.input :name
      f.input :job
      f.submit 'Go', name: 'registratio'
    end
    assert_equal(expected, html)
  end

  def test_not_exists_user_method
    assert_raises(NoMethodError) do
      HexletCode.form_for @user1, url: '/users' do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age
      end
    end
  end
end
