require "csv"
data = CSV.read("data.csv")

prices_in_pennies = []
items = []

data.each do |array|
  array.each do |array_element|
    if /\d/.match(array_element)
      price_as_string = array_element.strip.slice(1..).split(".")
      price_in_pennies = (price_as_string[0].to_i * 100) + (price_as_string[1].to_i * 1)
      prices_in_pennies << price_in_pennies
    else
      items << array_element
    end
  end
end

items_price = {}

index = 0
while index < items.length
  items_price[items[index]] = prices_in_pennies[index]
  index += 1
end

pp items_price
