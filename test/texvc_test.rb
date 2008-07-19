require File.dirname(__FILE__) + '/test_helper.rb'

require "test/unit"
class TexvcTest < Test::Unit::TestCase
  def test_generate_image
    image = Texvc.parse('y=x^2')
    assert_not_nil image
    assert_equal Magick::Image, image.class
  end

  def test_invalid_latex
    assert_raise Texvc::UnknownFunctionError do
      Texvc.parse('\foo')
    end
  end
end
