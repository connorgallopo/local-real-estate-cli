class LocalRealEstate::Listing

  attr_accessor :address, :url, :price, :bedrooms, :bathrooms, :sqft, :description

  def initialize(address: nil, url: nil, price: nil, bedrooms: nil, bathrooms: nil, sqft: nil, description: nil)
    @address = address
    @url = url
    @price = price
    @bedrooms = bedrooms
    @bathrooms = bathrooms
    @sqft = sqft
    @description = description
  end
end
