# == Schema Information
#
# Table name: blocks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer          not null
#

class Block < ApplicationRecord
  has_many :cards, dependent: :destroy
  belongs_to :user

  validates :title, presence: { message: 'Необходимо заполнить поле.' }

  def current?
    id == user.current_block_id
  end
end
