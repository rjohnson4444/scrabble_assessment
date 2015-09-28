gem 'minitest'
require './lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_lowercase_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_two_letter_word_that_is_lowercase
    assert_equal 2, Scrabble.new.score("at")
    assert_equal 4, Scrabble.new.score("me")
    assert_equal 2, Scrabble.new.score("it")
  end

  def test_it_can_score_three_or_more_letter_words_that_is_lowercase
    assert_equal 5, Scrabble.new.score("cat")
    assert_equal 10, Scrabble.new.score("bike")
    assert_equal 12, Scrabble.new.score("bought")
  end

  def test_it_can_score_upcased_words_of_various_lengths
    assert_equal 5, Scrabble.new.score("Cat")
    assert_equal 10, Scrabble.new.score("Bike")
    assert_equal 12, Scrabble.new.score("Bought")
  end

  def test_it_returns_0_when_word_is_empty
    assert_equal 0, Scrabble.new.score("")
  end

  def test_it_retuns_0_when_word_is_nil
    assert_equal 0, Scrabble.new.score(nil)
  end

  def test_it_does_not_score_punctuation_or_spaces
    assert_equal 3, Scrabble.new.score("U.S.A")
    assert_equal 10, Scrabble.new.score("Bring-it")
    assert_equal 12, Scrabble.new.score("Why?")
    assert_equal 7, Scrabble.new.score("I won")
  end
end
