class Log < ActiveRecord::Base
  belongs_to :user
  enum status: [:success, :failure]
end
