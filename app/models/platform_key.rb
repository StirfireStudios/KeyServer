class PlatformKey < ApplicationRecord
  belongs_to :key, optional: true
  belongs_to :platform
  belongs_to :game
end
