require './lib/user'

class OpenMic

attr_reader :preformers

  def initialize(event)
    @event = event
    @preformers = []
    @repeated_jokes = false
  end

  def location
    @event[:location]
  end

  def date
    @event[:date]
  end

  def welcome(preformer)
    @preformers << preformer
  end

  def repeated_jokes?
    event_jokes = []
    @preformers.each do |user|
      event_jokes << user.jokes
    end
    event_jokes.flatten
    if event_jokes.flatten.count != event_jokes.count
      @repeated_jokes = true
    end
    @repeated_jokes
  end



end
