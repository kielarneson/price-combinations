require "csv"
data = CSV.read("data.csv")

prices_in_pennies = []
items = []

data.each do |array|
  array.each do |array_element|
    if /\d/.match(array_element)
      array_element = array_element.strip.slice(1..)
      array_element = array_element.split(".")
      array_element = (array_element[0].to_i * 100) + (array_element[1].to_i * 1)
      prices_in_pennies << array_element
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
