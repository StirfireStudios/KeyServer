class KeyCategory < ApplicationRecord
  has_many :keys

  validates :value, presence: true
end
