module KeyImporter

  def self.GetPlatformKeys(game_name, platform_name, file)
    game = Game.where(name: game_name).first
    platform = Platform.where(name: platform_name).first
    error = false
    if game.nil?
      print "Could not find game \"#{game_name}\"\n"
      error = true
    end

    if platform.nil?
      print "Could not find platform \"#{platform_name}\"\n"
      error = true
    end

    unless File.exists?(file)
      print "Could not find file \"#{file}\"\n"
      error = true
    end

    return -1 if error == true

    File.open(file, "r").each_line do |line|
      key = line.strip
      if PlatformKey.where(platform: platform, value: key).first.nil?
        PlatformKey.create(platform: platform, game: game, value: key)
      else
        print "Key \"#{key}\" exists in platform \"#{platform.name}\""
      end
    end

    return 0
  end

  def self.GetGeneratedKeys(game_name, file)
    game = Game.where(name: game_name).first
    error = false

    if game.nil?
      print "Could not find game \"#{game_name}\"\n"
      error = true
    end

    unless File.exists?(file)
      print "Could not find file \"#{file}\"\n"
      error = true
    end

    return -1 if error == true

    line_index = 1

    File.open(file, "r").each_line do |line|
      key = line.strip.scan(/[0-9A-Z]*/).join
      begin
        hexstring = BaseX::Base30U.string_to_integer(key).to_s(16)
        uuidstring = "#{hexstring[0..7]}-#{hexstring[8..11]}-#{hexstring[12..15]}-#{hexstring[16..19]}-#{hexstring[20..-1]}"
        if Key.where(id: uuidstring).present?
          print "Line #{line_index} key #{key} exists\n"
        else
          Key.create(game: game, id: uuidstring)
        end
      rescue BaseX::InvalidNumeral
        print "Line #{line_index} has unparsable key - #{key}\n"
      end

      line_index += 1
    end

    return 0
  end

end
