class Log < ApplicationRecord
  belongs_to :user
  enum status: [:success, :failure]
end
