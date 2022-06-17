# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  def setup
    constant_user = Struct.new(:name, :job, :gender, keyword_init: true)
    @user1 = constant_user.new name: 'rob', job: 'hexlet', gender: 'm'
    @user2 = constant_user.new job: 'hexlet'
    @form1 = load_fixtures('form1.html')
    @form2 = load_fixtures('form2.html')
    @form3 = load_fixtures('form3.html')
  end

  def test_default_attr
    html = HexletCode.form_for @user1 do |f|
      f.input :name
      f.input :job, as: :text
      f.submit
    end
    assert_equal(@form1, html)
  end

  def test_custom_attr
    html = HexletCode.form_for @user1, url: '/users' do |f|
      f.input :name, class: 'user-input'
      f.input :job, as: :text, rows: 50, cols: 50
      f.submit
    end
    assert_equal(@form2, html)
  end

  def test_create_custom_submit
    html = HexletCode.form_for @user2 do |f|
      f.input :name
      f.input :job
      f.submit 'Go', name: 'registratio'
    end
    assert_equal(@form3, html)
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
