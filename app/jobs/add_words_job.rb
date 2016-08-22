class AddWordsJob < ActiveJob::Base
  queue_as :default

  def perform(user_id, params)
    WordsParser.new(user_id, params).run
  end
end
