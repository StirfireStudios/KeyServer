module KeyGenerator

  def self.Generate(game_name, number)
    game = Game.where(name: game_name).first
    if game.nil?
      print "Could not find game \"#{game_name}\""
      return -1
    end

    (1..number).each do |x|
      key = game.keys.create
      print "#{key.friendly_key}\n"
    end

    return 0
  end
end
