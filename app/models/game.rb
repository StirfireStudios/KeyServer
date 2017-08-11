class Game < ApplicationRecord
  has_many :platform_keys
  has_many :keys

  def platforms
    ids = platform_keys.where(key: nil).pluck(:platform_id).uniq
    Platform.where(id: ids)
  end
end
