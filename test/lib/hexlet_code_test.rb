# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  def setup
    contant_user = Struct.new(:name, :job, keyword_init: true)
    @user = contant_user.new
  end

  def test_form_for
    expected = ['<form action="#" method="post">', '</form>']
    html = HexletCode.form_for @user do |f|
      puts f
    end
    assert_equal(expected.join('\n'), html)
  end

  def test_form_for_with_url
    expected = ['<form action="/users" method="post">', '</form>']
    html = HexletCode.form_for @user, url: '/users' do |f|
      puts f
    end
    assert_equal(expected.join('\n'), html)
  end
end
