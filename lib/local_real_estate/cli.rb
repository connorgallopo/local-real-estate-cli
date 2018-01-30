class LocalRealEstate::CLI
  def call
    greeting
    menu
  end

  def greeting
    puts '/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/'
    puts 'Welcome to the Local Real Estate Listing app'
    puts 'This will display local real estate listings by zip code and allow you to see expanded details on each listing'
    puts ''
  end

  # def menu
  #   puts 'Please select from one of the following options below:'
  #   puts 'If you would like to see the listings in your area by Zip Code press 1'
  #   puts 'If you would like to see the listings by a major city press 2'
  #   puts 'If you would like to see listings in a random city press 3'
  #   puts 'Or type "exit"'
  #   input = gets.strip.downcase
  #   unless input == 'exit'
  #     case input
  #     when '1'
  #       zip_method
  #       print_listings
  #     when '2'
  #       # list_cities (possibly a method that lists available cities?)
  #     when '3'
  #       # list_cities.sample (if list cities holds an array we can sample it to randomize)
  #     end
  #     goodbye
  #   end
  # end

  def menu
    new_search
    puts 'To see more info on a listing, please select a number from the list above:'
    selection = gets.strip
    detailed_view(selection)
    puts 'To go back to the previous list, type "back". Or type "new" to start a new search by zip.'
    input = gets.strip.downcase
      if input == "back"
        print_listings
      elsif input == "new"
        new_search
      end
  end

  def new_search
    LocalRealEstate::Listing.all.clear
    puts 'Please type in the Zip code in which you would like to search'
    zip_method
    print_listings
  end

  def detailed_view(selection)
    home = LocalRealEstate::Listing.all[selection.to_i - 1]
    puts "Address: #{home.address}. #{home.city},#{home.state}."
    puts "Price: #{home.price}"
    puts "#{home.bedrooms}, #{home.bathrooms}"
    puts "Size: #{home.sqft}"
    puts "Garage: #{home.cars}"
  end
  
  def zip_method
    zip_code = gets.strip
    listings = LocalRealEstate::Scraper.new(zip_code)
    listings.create_listings
  end

  def print_listings
    puts "----------Listings in #{LocalRealEstate::Listing.current_city}----------"
    LocalRealEstate::Listing.all.each_with_index do |listing, i|
      puts "#{i+1}. #{listing.address} - #{listing.bedrooms} #{listing.price}"
    end
    puts "-------------------------------------------"
  end

  def goodbye
    puts 'See you next time'
  end
end
