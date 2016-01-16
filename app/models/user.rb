class User < ApplicationRecord
  validates :phone_uuid, presence: true
  # going to put devise auth and stuff but for now only placeholder
end
