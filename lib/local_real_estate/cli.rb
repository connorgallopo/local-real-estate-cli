class LocalRealEstate::CLI
  def call
    greeting
    menu
  end

  def greeting
    puts "Welcome"
  end

  def menu
    puts 'Please select from one of the options below:'
    puts 'If you would like to see the listings in your area by Zip Code press 1'
    puts 'If you would like to see the listings by a major city press 2'
    puts 'If you would like to see listings in a random city press 3'
    puts 'Or type "exit"'
    input = gets.strip.downcase
    unless input == 'exit'
      case input
      when '1'
        puts "enter your zip"
        zip_code = gets.strip
        LocalRealEstate::Scraper.new.get_page(zip_code)
      when '2'
        #list_cities (possibly a method that lists available cities?)
      when '3'
        #list_cities.sample (if list cities holds an array we can sample it to randomize)
      end
    end
  end
end
