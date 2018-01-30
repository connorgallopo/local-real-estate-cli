require 'open-uri'
require 'pry'
require 'nokogiri'

#Each Indoc.css('.srp-item-body')

class LocalRealEstate::Scraper
  attr_accessor :zip

  def initialize(zip)
    @zip = zip
  end

  def get_page #this needs to be fixed. If zip starts with zero its lost with .to_i
    Nokogiri::HTML(open("https://www.realtor.com/realestateandhomes-search/#{@zip}"))
  end

  def scrape_listings
    self.get_page.css('.srp-item-body')
  end

  def create_listings
    scrape_listings.each_with_index do |object, index|
      one = LocalRealEstate::Listing.new(
        address:object.css('.srp-item-address')
        )
      binding.pry
    end
  end

end
