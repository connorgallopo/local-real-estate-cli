class LocalRealEstate::Listing

  attr_accessor :address, :city, :state, :url, :price, :bedrooms, :bathrooms, :sqft, :cars
  @@all = []

  def initialize(address: nil, city: nil, state: nil, url: nil, price: nil, bedrooms: nil, bathrooms: nil, sqft: nil, cars: nil)
    @address = address
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
end
