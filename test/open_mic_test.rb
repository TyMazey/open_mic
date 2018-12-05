require './lib/open_mic'
require 'Minitest/autorun'

class OpenMicTest < Minitest::Test

  def test_it_exsist
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})

    assert_instance_of OpenMic, open_mic
  end

  def test_it_has_location
    #skip
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})

    assert_equal "Comedy Works", open_mic.location
  end

  def test_it_has_date
    #skip
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})

    assert_equal "11-20-18", open_mic.date
  end

  def test_it_has_preformers
    #skip
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})

    assert_equal [], open_mic.preformers
  end

  def test_it_can_have_preformers
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    sal = User.new("Sal")
    ali = User.new("Ali")
    open_mic.welcome(sal)
    open_mic.welcome(ali)

    assert_equal [sal, ali], open_mic.preformers
  end

  def test_it_can_tell_a_repeted_joke
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    sal = User.new("Sal")
    ali = User.new("Ali")
    joke_1 = Joke.new(1, "knock knock", "apple")
    joke_2 = Joke.new(2, "chicken crosses road", "whos there")
    open_mic.welcome(sal)
    open_mic.welcome(ali)
    ali.learn(joke_1)
    ali.learn(joke_2)

    assert_equal false, open_mic.repeated_jokes?
  end

  def test_it_can_tell_a_repeted_joke_happens
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    sal = User.new("Sal")
    ali = User.new("Ali")
    joke_1 = Joke.new(1, "knock knock", "apple")
    joke_2 = Joke.new(2, "chicken crosses road", "whos there")
    open_mic.welcome(sal)
    open_mic.welcome(ali)
    ali.learn(joke_1)
    ali.learn(joke_2)
    ali.tell(sal, joke_1)

 
    assert_equal true, open_mic.repeated_jokes?
  end
end
