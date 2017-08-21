class Key < ApplicationRecord
  belongs_to :game
  has_one :platform_key

  validates :redeemed_at, absence: true, unless: :redeemed?
  validates :redeemed_at, presence: true, if: :redeemed?

  def friendly_key
    number = id.scan(/[0-9a-f]/).join.to_i(16)
    keystring = BaseX::Base30U.integer_to_string(number)
    "#{keystring[0..4]}-#{keystring[5..9]}-#{keystring[10..14]}-#{keystring[15..19]}-#{keystring[20..-1]}"
  end

  def redeemed?
    platform_key.present?
  end

  def redeem_for!(platform)
    return false if redeemed?
    key = nil

    ActiveRecord::Base.transaction do
      key = PlatformKey.where(game: game, platform: platform, key: nil).first
      unless key.nil?
        key.key = self
        key.save
        self.redeemed_at = Time.now
        self.save
      end
    end

    return key.present?
  end

  def self.find_matching_key(friendly_key)
    keystring = friendly_key.strip.scan(/[0-9A-Z]/).join
    begin
      hexstring = BaseX::Base30U.string_to_integer(keystring).to_s(16).rjust(32, "0")
      uuidstring = "#{hexstring[0..7]}-#{hexstring[8..11]}-#{hexstring[12..15]}-#{hexstring[16..19]}-#{hexstring[20..-1]}"
      self.where(id: uuidstring).first
    rescue BaseX::InvalidNumeral
      return nil
    end
  end
end
