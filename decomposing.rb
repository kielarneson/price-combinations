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

def two_items(array)
  index1 = 0
  index2 = 0
  combos = []

  while index1 < array.length
    while index2 < array.length
      if array[index1][1] != array[index2][1] && array[index1][1] + array[index2][1] == 1505
        combos << array[index1][1]
        combos << array[index2][1]
      end
      index2 += 1
    end
    index1 += 1
    index2 = 0
  end

  if combos.any?
    p combos
  else
    p "No combos"
  end
end

two_items(menu_items_prices)

def three_items(array)
  index1 = 0
  index2 = 0
  index3 = 0
  combos = []

  while index1 < array.length
    while index2 < array.length
      while index3 < array.length
        if array[index1][1] != array[index2][1] && array[index1][1] != array[index3][1] && array[index2][1] != array[index3][1] && array[index1][1] + array[index2][1] + array[index3][1] == 1505
          combos << array[index1][1]
          combos << array[index2][1]
          combos << array[index3][1]
        end
        index3 += 1
      end
      index2 += 1
      index3 = 0
    end
    index1 += 1
    index2 = 0
  end

  if combos.any?
    return combos
  else
    return "No combos"
  end
end

p three_items(menu_items_prices)

# def subset_sum(numbers, target, partial = [])
#   s = partial.inject 0, :+
#   # check if the partial sum is equals to target

#   puts "sum(#{partial})=#{target}" if s == target

#   return if s >= target # if we reach the number why bother to continue

#   (0..(numbers.length - 1)).each do |i|
#     n = numbers[i]
#     p "i = #{i}"
#     p "n = #{n}"
#     remaining = numbers.drop(i + 1)
#     p "partial #{partial}"
#     p "remaining = #{remaining}"
#     subset_sum(remaining, target, partial + [n])
#   end
# end

# subset_sum([3, 9, 8, 4, 5, 7, 10], 15)
