class LocalRealEstate::Listing

  attr_accessor :address, :city, :state, :url, :price, :bedrooms, :bathrooms, :sqft, :cars
  @@all = []

  def initialize(address: nil, city: nil, state: nil, url: nil, price: nil, bedrooms: nil, bathrooms: nil, sqft: nil, cars: "none")
    @address = address
    @city = city
    @state = state
    @url = url
    @price = price
    @bedrooms = bedrooms
    @bathrooms = bathrooms
    @sqft = sqft
    @cars = cars
    @@all << self
  end

  def self.all
    @@all
  end

  def self.current_city
    @@all[0].city
  end
end
