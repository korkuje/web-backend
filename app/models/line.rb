class Line < ApplicationRecord
  has_many :problems, dependent: :nullify
end
