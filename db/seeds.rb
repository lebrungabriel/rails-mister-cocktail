# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Ingredient.destroy_all
Cocktail.destroy_all

url_parsing = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
list_items = JSON.parse(open(url_parsing).read)
list_items['drinks'].each do |item|
  new_drink = Ingredient.create(name: item['strIngredient1'])
  puts "#{new_drink.name}"
end

mojito = Cocktail.create!(name: 'mojito')
