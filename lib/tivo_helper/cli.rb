class TivoHelper::CLI

  def call
    puts "Upcoming Tivo Premieres:"
    list_shows
    menu
    goodbye
  end

  def list_shows
    TivoHelper::Show.all
  end

  def menu
    help
    puts "Please enter the number of your choice."
    input = nil
    while input != "exit"
      input = gets.chomp.downcase
      case input
      when "1"
        puts "TV Premieres Listed by Time:"
      when "2"
        puts "TV Premieres Listed by Genre:"
      when "3"
        puts "TV Premieres Listed by Network:"
      when "help"
        help
      else
        puts "I don't recognize that input. Type help for your options."
      end
    end
  end

  def goodbye
    puts "Goodbye."
  end

  def help
    puts "How would you like to view your tv premieres?"
    puts "1. By Time"
    puts "2. By Genre"
    puts "3. By Network"
  end
end
