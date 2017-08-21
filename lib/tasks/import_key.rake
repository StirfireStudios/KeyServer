require "#{Rails.root}/lib/cli_utils"

namespace :keys do
  desc "Import platform keys for a given game"
  task "import:platform" => :environment do
    filename = CliUtils.GetFile("File to import platform keys from?")
    game = CliUtils.GetObject(Game, "Game to import keys for?")
    platform = CliUtils.GetObject(Platform, "Platform to import keys for")

    if CliUtils.Confirm("import keys for #{game.name} on #{platform.name} from #{filename}?")
      lines = 0
      File.open(filename, "r").each_line do |line|
        key = line.strip
        if PlatformKey.where(platform: platform, value: key).first.nil?
          PlatformKey.create(platform: platform, game: game, value: key)
        else
          print "Key \"#{key}\" exists in platform \"#{platform.name}\"\n"
        end
        lines += 1
      end
      puts "Imported #{lines} keys\n"
    end
  end

  desc "Import redeemable keys for a given game"
  task "import:redeemable" => :environment do
    filename = CliUtils.GetFile("File to import keys from?")
    category = CliUtils.GetObject(KeyCategory, "What category do these keys go in?")
    game = CliUtils.GetObject(Game, "Game to import keys for?")

    if CliUtils.Confirm("import keys for #{game.name} from #{filename}?")
      line_index = 1

      File.open(filename, "r").each_line do |line|
        key = line.strip.scan(/[0-9A-Z]*/).join
        begin
          hexstring = BaseX::Base30U.string_to_integer(key).to_s(16).rjust(32, "0")
          uuidstring = "#{hexstring[0..7]}-#{hexstring[8..11]}-#{hexstring[12..15]}-#{hexstring[16..19]}-#{hexstring[20..-1]}"
          if Key.where(id: uuidstring).present?
            print "Line #{line_index} key #{key} exists\n"
          else
            Key.create(game: game, id: uuidstring, key_category: category)
          end
        rescue BaseX::InvalidNumeral
          print "Line #{line_index} has unparsable key - #{key}\n"
        end

        line_index += 1
      end

      puts "Imported #{line_index - 1} keys\n"
    end
  end
end


