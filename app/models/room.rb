class Room < ApplicationRecord
  has_many :messages

  validates :start_time, uniqueness: true
end
