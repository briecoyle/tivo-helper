class TivoHelper::CLI

  def call
    TivoHelper::Scraper.new.make_shows
    puts "Upcoming Tivo Premieres:"
    list_shows
    menu
    goodbye
  end

  def list_shows
    shows = TivoHelper::Show.all
    shows.each.with_index(1) do |show, i|
      puts "#{i}. #{show.name} - #{show.genre} - #{show.network}"
    end
  end

  def menu
    help
    puts "Please enter the number of your choice."
    input = nil
    while input != "exit"
      input = gets.chomp.downcase
      if input == "1"
        puts "TV Premieres Listed by Time:"
        puts "#{TivoHelper::Show.sort_by_time}"
      elsif input == "2"
        puts "TV Premieres Listed by Genre:"
        puts "#{TivoHelper::Show.sort_by_genre}"
      elsif input == "3"
        puts "TV Premieres Listed by Network:"
        puts "#{TivoHelper::Show.sort_by_network}"
      elsif input == "help"
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
