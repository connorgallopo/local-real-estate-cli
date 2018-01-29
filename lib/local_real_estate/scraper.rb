require 'open-uri'
require 'pry'
require 'nokogiri'

class LocalRealEstate::Scraper

  def get_page(zip_code = "02359") #this needs to be fixed. If zip starts with zero its lost with .to_i
    html = open("https://www.realtor.com/realestateandhomes-search/#{zip_code.to_i}")
    doc = Nokogiri::HTML(html)
    binding.pry
  end
end
