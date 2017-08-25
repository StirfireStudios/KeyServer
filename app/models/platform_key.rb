class PlatformKey < ApplicationRecord
  belongs_to :key, optional: true
  belongs_to :platform
  belongs_to :game

  validates :value, presence: true
end
