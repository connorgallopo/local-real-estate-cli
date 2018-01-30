class LocalRealEstate::Listing

  attr_accessor :address, :city, :state, :url, :price, :bedrooms, :bathrooms, :sqft, :cars, :lot_size
  @@all = []

  def initialize(address: nil, city: nil, state: nil, url: nil, price: nil, bedrooms: nil, bathrooms: nil, sqft: nil, cars: "none", lot_size: nil)
    @address = address
    @city = city
    @state = state
    @url = url
    @price = price
    @bedrooms = bedrooms
    @bathrooms = bathrooms
    @sqft = sqft
    @cars = cars
    @lot_size = lot_size
    @@all << self
  end

  def self.all
    @@all
  end

  def self.current_city
    @@all[0].city
  end
end
