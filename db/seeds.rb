class Shoe < ActiveRecord::Base
  list = [
    "Nike",
    "Adidas",
    "Jordan",
    "New Balance"
  ]

  list.each do |name|
    Shoe.create(brand: name)
  end
end

class Store < ActiveRecord::Base
  list = [
    ["Hypebeast", "NYC"],
    ["Sneakerheads", "LA"],
    ["Overpriced", "Chicago"],
    ["OG", "Hong Kong"]
  ]

  list.each do |name, location|
    Store.create(name: name, location: location)
  end
end
