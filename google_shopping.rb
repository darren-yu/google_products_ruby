#RUBY!! no more semi-colons... ever.

require 'json'
file = File.read("./products.json")

#Welcome to RUBY we use snake case now
#snake case word_word not camel case wordWord
google_data = JSON.parse(file)


#outputs the full object
# puts google_data.inspect

#outputs the first item's title
# puts google_data["items"][0]["product"]["title"]


items_array = google_data["items"]


# Problem 1.
# Go through the items array and find all kinds = "shopping#products"

count = 0;
items_array.each do |item|
	if item["kind"] == "shopping#product"
		puts item["product"]["title"]
		count += 1
	end
	
end
puts "\n" + "-" * 25
puts count
puts "\n" + "-" * 25


# Problem 2
# Find all items with backorder availabilty in inventories.

items_array.each do |item|
	if item["product"]["inventories"][0]["availability"] == "backorder"
		puts item["product"]["title"]
	end
end
puts "\n" + "-" * 25


# Problem 3
# Find all items with more than one image link.

items_array.each do |item|
	if item["product"]["images"].length > 1
		puts item["product"]["title"]
	end
end
puts "\n" + "-" * 25


# Problem 4
# Find all canon products in the items (careful with case sensitivity).
puts "\nAll Canon Products:\n "
items_array.each do |item| 
	if item["product"]["brand"].downcase == "canon"
		puts item["product"]["title"]
	end
end
puts "\n" + "-" * 25


# Problem 5
# Find all items that have product author name of "eBay" and are brand "Canon".
puts "\nAll items with product author name eBay and are brand Canon:\n "
items_array.each do |item|
	if ((item["product"]["author"]["name"].downcase.include? "ebay") && (item["product"]["brand"].downcase == "canon"))
		puts item["product"]["title"]
	end
end
puts "\n" + "-" * 25


# Problem 6
# Print all the products with their brand, price, and a image link
puts "\nAll products with their brand, price, and a image link:\n\n"
items_array.each do |item|
	puts "Brand: #{item["product"]["brand"]}\n"
	puts "Price: #{item["product"]["inventories"][0]["price"]}\n"
	puts "Images: #{item["product"]["images"][0]}\n\n"
	puts "-" * 25
end















