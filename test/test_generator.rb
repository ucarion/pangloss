require_relative 'test_helper'

class GeneratorTest < Pangloss::TestCase
  def setup
    @gen = Pangloss::Generator.new
  end

  def test_can_setup
    assert_nothing_raised do
      Pangloss::Generator.new
    end
  end

  def test_can_generate_word
    assert_nothing_raised do
      @gen.get_word
    end
  end

  def test_can_generate_words
    assert_nothing_raised do
      @gen.get_words(10)
    end
  end

  def test_doesnt_return_empty_string
    100.times do
      assert @gen.get_word.length > 0
    end
  end

  def test_detects_nonexistant_dictionary
    assert_raise(RuntimeError) do
      Pangloss::Generator.new(language: :gibberish, depth: 7)
    end
  end

  def test_doesnt_return_too_stort_strings
    gen = Pangloss::Generator.new(min_length: 3)

    100.times do
      assert gen.get_word.length >= 3
    end
  end
end