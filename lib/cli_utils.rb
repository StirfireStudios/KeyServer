require 'highline'

module CliUtils
  def self.GetGame(prompt = "Game Name?")
    cli = HighLine.new
    selected_game = nil
    while selected_game.blank?
      query_string = cli.ask prompt
      if query_string.strip.blank?
        puts "Nothing entered.\n"
        next
      end
      games = Game.where("LOWER(name) LIKE lower(?)", "%#{query_string.strip}%")
      if games.empty?
        puts "No Matching Games\n"
        next
      end

      menu = HighLine::Menu.new

      cli.choose do |menu|
        games.each do |game|
          menu.choice(game.name) { selected_game = game }
        end
        menu.choice("None of the above")
      end
    end

    return selected_game
  end

  def self.GetInteger(prompt = "Enter Number")
    cli = HighLine.new
    cli.ask(prompt, Integer)
  end

  def self.Confirm(prompt = "Proceed? (y/n)")
    cli = HighLine.new
    cli.agree(prompt)
  end

end
