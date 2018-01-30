class LocalRealEstate::CLI
  def call
    greeting
    menu
  end

  def greeting
    puts '/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/'
    puts ' /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/'
    puts 'Welcome to the Local Real Estate Listing app'
    puts 'This will display local real estate listings by zip code and allow you to see expanded details on each listing'
    puts ''
  end

  def menu
    new_search
    detail_menu
  end

  def detail_menu
    print_listings
    puts 'To see more info on a listing, please select a number from the list above:'
    detailed_view(gets.strip)
    puts 'To go back to the previous list type "back". Or "new" to start a new search by zip. To quit, type "exit"'
    input = gets.strip.downcase
    if input == 'back'
      detail_menu
    elsif input == 'new'
      menu
    elsif input == 'exit'
      goodbye
    else 
      invalid_input
    end
  end

  def new_search
    LocalRealEstate::Listing.all.clear
    puts 'Please type in the Zip code in which you would like to search'
    zip_method
  end

  def detailed_view(selection)
    home = LocalRealEstate::Listing.all[selection.to_i - 1]
    puts '-------------------------------------------'
    puts "Address: #{home.address}. #{home.city},#{home.state}."
    puts "Price: #{home.price}"
    puts "Bedrooms:#{home.bedrooms}"
    puts "Bathrooms: #{home.bathrooms}"
    unless home.sqft == "" thenputs "Square Feet: #{home.sqft}"
    unless home.lot_size == "" then puts "Lot Size #{home.lot_size}"
    unless home.cars == "" then puts "Garage: #{home.cars}" end
    puts '-------------------------------------------'
  end
 
  def zip_method
    LocalRealEstate::Scraper.new(gets.strip).create_listings
  end

  def print_listings
    puts "--------Listings in #{LocalRealEstate::Listing.current_city}--------"
    LocalRealEstate::Listing.all.each_with_index do |listing, i|
      puts "#{i + 1}. #{listing.address} - #{listing.bedrooms} #{listing.price}"
    end
    puts '-------------------------------------------'
  end

  def invalid_input
    puts "Invalid input"
  end

  def goodbye
    puts 'See you next time!'
  end
end
