# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Movie.destroy_all
10.times do
  movie = Movie.create(
    title: Faker::Book.title,
    overview: Faker::Movies::HarryPotter.quote,
    poster_url: Faker::Movies::HarryPotter.spell,
    rating: Faker::Number.between(from: 1, to: 10)
  )
  movie.save!
end
