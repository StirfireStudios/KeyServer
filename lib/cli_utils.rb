require 'highline'

module CliUtils
  def self.GetObject(type, prompt = "Name?")
    cli = HighLine.new
    selected = nil
    while selected.blank?
      query_string = cli.ask prompt
      if query_string.strip.blank?
        puts "Nothing entered.\n"
        next
      end
      matches = type.where("LOWER(name) LIKE lower(?)", "%#{query_string.strip}%")
      if matches.empty?
        puts "None Matching\n"
        next
      end

      menu = HighLine::Menu.new

      cli.choose do |menu|
        matches.each do |match|
          menu.choice(match.name) { selected = match }
        end
        menu.choice("None of the above")
      end
    end

    return selected
  end

  def self.GetFile(prompt = "Enter filename")
    cli = HighLine.new
    file_exists = false
    filename = nil

    until file_exists
      filename = cli.ask(prompt)
      if filename.strip.blank?
        puts "Nothing entered.\n"
        next
      end

      file_exists = File.exists? filename
    end

    return filename
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
