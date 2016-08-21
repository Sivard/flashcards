class AddWordsJob < ActiveJob::Base
  queue_as :default

  def perform(params, user_id)
    Word.new(params, user_id).run
  end
end
