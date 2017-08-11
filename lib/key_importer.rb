module KeyImporter

  def self.Import(game_name, platform_name, file)
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

end
