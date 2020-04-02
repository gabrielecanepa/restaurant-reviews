puts "Destroying database..."
Restaurant.destroy_all
Review.destroy_all

10.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    stars: rand(1..5),
    chef: Faker::TvShows::SouthPark.character,
  )

  10.times do
    review = Review.create(
      content: Faker::Restaurant.review,
      restaurant: restaurant
    )
  end

  puts "Restaurant #{restaurant.name} created!"
end



puts "Done!"
