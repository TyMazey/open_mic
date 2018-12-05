require 'minitest/autorun'
require './lib/user'

class UserTest < Minitest::Test

  def test_it_exsist
    sal = User.new("Sal")

    assert_instance_of User, sal
  end

  def test_user_has_name
    sal = User.new("Sal")

    assert_equal "Sal", sal.name
  end

  def test_it_has_jokes
    sal = User.new("Sal")

    assert_equal [], sal.jokes
  end

  def test_user_can_learn_jokes
    sal = User.new("Sal")
    joke_1 = Joke.new(1, "knock knock", "apple")
    joke_2 = Joke.new(2, "chicken crosses road", "whos there")
    sal.learn(joke_1)
    sal.learn(joke_2)

    assert_equal [joke_1, joke_2], sal.jokes
  end

  def test_user_can_tell_jokes
    sal = User.new("Sal")
    ali = User.new("Ali")
    joke_1 = Joke.new(1, "knock knock", "apple")
    joke_2 = Joke.new(2, "chicken crosses road", "whos there")
    sal.learn(joke_1)
    sal.learn(joke_2)
    sal.tell(ali, joke_1)
    sal.tell(ali, joke_2)

    assert_equal [joke_1, joke_2], ali.jokes
  end

  def test_can_read_joke_by_id
    sal = User.new("Sal")
    ali = User.new("Ali")
    joke_1 = Joke.new(1, "knock knock", "apple")
    joke_2 = Joke.new(2, "chicken crosses road", "whos there")
    sal.learn(joke_1)
    sal.learn(joke_2)
    sal.tell(ali, joke_1)
    sal.tell(ali, joke_2)

    assert_equal joke_1, ali.joke_by_id(1)
    assert_equal joke_2, ali.joke_by_id(2)
  end 

end
