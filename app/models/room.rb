class Room < ApplicationRecord
  has_many :messages

  validates :name, :start_time, presence: true
  validates :start_time, uniqueness: true
end
