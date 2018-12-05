require './lib/joke'
require 'minitest/autorun'

class JokeTest < Minitest::Test

  def test_it_exsist
    joke = Joke.new(1, "Setup", "Punchline")

  assert_instance_of Joke, joke
  end

  def test_it_has_id
    joke = Joke.new(1, "Setup", "Punchline")

  assert_equal 1, joke.id
  end

  def test_it_has_setup
    joke = Joke.new(1, "Setup", "Punchline")

    assert_equal "Setup", joke.setup
  end

  def test_it_has_punchline
    joke = Joke.new(1, "Setup", "Punchline")

    assert_equal "Punchline", joke.punchline
  end
end
