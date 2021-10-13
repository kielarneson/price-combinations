require "csv"
data = CSV.read("data.csv")

prices_in_pennies = []
items = []

data.each do |array|
  array.each do |array_element|
    if /\d/.match(array_element)
      price_in_pennies = array_element.strip.slice(1..).split(".").join.to_i
      prices_in_pennies << price_in_pennies
    else
      items << array_element
    end
  end
end

target_price = []
menu_items_prices = []

index = 0
while index < items.length
  if index == 0
    target_price << items[index]
    target_price << prices_in_pennies[index]
  else
    menu_items_prices << [items[index], prices_in_pennies[index]]
  end
  index += 1
end

pp menu_items_prices

index = 0
while index < menu_items_prices.length
  if target_price[1] % menu_items_prices[index][1] == 0
    p menu_items_prices[index]
  else
    p "Multiple orders of #{menu_items_prices[index][0]} does not equal the target price"
  end
  index += 1
end
