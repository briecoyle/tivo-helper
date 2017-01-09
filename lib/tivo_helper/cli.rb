class TivoHelper::CLI

  def call
    TivoHelper::Scraper.new.make_shows
    puts "Welcome to the Tivo Helper!"
    menu
    goodbye
  end

  def list_shows
    TivoHelper::Show.all.each.with_index(1) do |show, i|
      puts "#{i}. #{show.name} - #{show.genre} - #{show.network}"
    end
  end

  def menu
    help
    input = nil
    while input != "exit"
      input = gets.chomp.downcase
      if input == "1"
        list_shows
      elsif input == "2"
        list_genres
        genre_search
      elsif input == "3"
        list_networks
        network_search
      elsif input == "exit"
        puts ""
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
    puts ""
    puts "Please enter the number of your choice."
    puts "Or type exit to leave the program."
    puts ""
  end

  def network_search
    puts "Please enter one network to find shows that match."
    network_input = gets.chomp
    puts ""
    matched_shows = TivoHelper::Show.find_all_by_network(network_input)
    matched_shows.each.with_index(1) do |show, i|
      puts "#{i}. #{show.name} - #{show.genre} - #{show.network}"
    end
    puts ""
    check_networks
  end

  def genre_search
    puts "Please enter one genre to find shows that match."
    genre_input = gets.chomp
    puts ""
    matched_shows = TivoHelper::Show.find_all_by_genre(genre_input)
    matched_shows.each.with_index(1) do |show, i|
      puts "#{i}. #{show.name} - #{show.genre} - #{show.network}"
    end
    puts ""
    check_genres
  end

  def list_genres
    puts "Here are your choices for genre:"
    puts "#{TivoHelper::Show.genres.join(", ")}"
    puts ""
  end

  def list_networks
    puts "Here are your choices for network:"
    puts "#{TivoHelper::Show.networks.join(", ")}"
    puts ""
  end

  def check_genres
    puts "Would you like to look at another genre? Y/N/list"
    answer = gets.chomp
    if answer == "Y"
      genre_search
    elsif answer == "list"
      list_genres
      genre_search
    elsif answer == "N"
      help
    end
  end

    def check_networks
      puts "Would you like to look at another network? Y/N/list"
      answer = gets.chomp
      if answer == "Y"
        network_search
      elsif answer == "list"
        list_networks
        network_search
      elsif answer == "N"
        help
      end
    end
end
