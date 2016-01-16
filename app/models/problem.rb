class Problem < ApplicationRecord
  belongs_to :user
  belongs_to :line

  validates :lat, :line, :reason, :user, presence: :true

  enum reason: {
    other: 0,
    accident: 1,
    breakdown: 2,
    high_traffic: 3
  }
end
