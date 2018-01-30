class LocalRealEstate::Listing

  attr_accessor :address, :url, :price, :bedrooms, :bathrooms, :sqft, :cars

  def initialize(address: nil, url: nil, price: nil, bedrooms: nil, bathrooms: nil, sqft: nil, cars: nil)
    @address = address
    @url = url
    @price = price
    @bedrooms = bedrooms
    @bathrooms = bathrooms
    @sqft = sqft
    @cars = cars
  end
end
