require "#{Rails.root}/lib/cli_utils"

namespace :keys do
  desc "Generate key(s) to redeem for a given game"
  task "generate" => :environment do
    game = CliUtils.GetObject(Game, "Game to generate keys for?")
    number = CliUtils.GetInteger("#{game.name} - redeemable codes to generate?")

    if CliUtils.Confirm("Generate #{number} codes for #{game.name}?")
      (1..number).each do |x|
        key = game.keys.create
        print "#{key.friendly_key}\n"
      end
    end
  end
end


