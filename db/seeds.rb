Movie.create!([
  {
    title: "Iron Man",
    rating: "PG-13",
    total_gross: 318412101.00,
    description: "Tony Stark builds an armored suit to fight the throes of evil",
    released_on: "2008-05-02",
    cast: "#{Faker::GameOfThrones.character}, #{Faker::GameOfThrones.character}, #{Faker::GameOfThrones.character}",
    director: Faker::FamilyGuy.character,
    duration: "#{rand(120..200)} minutes",
    image_file_name: Faker::Avatar.image
  },
  {
    title: "Superman",
    rating: "PG",
    total_gross: 134218018.00,
    description: "Clark Kent grows up to be the greatest super-hero",
    released_on: "1978-12-15",
    cast: "#{Faker::GameOfThrones.character}, #{Faker::GameOfThrones.character}, #{Faker::GameOfThrones.character}",
    director: Faker::FamilyGuy.character,
    duration: "#{rand(120..200)} minutes",
    image_file_name: Faker::Avatar.image
  },
  {
    title: "Spider-Man",
    rating: "PG-13",
    total_gross: 403706375.00,
    description: "Peter Parker gets bit by a genetically modified spider",
    released_on: "2002-05-03",
    cast: "#{Faker::GameOfThrones.character}, #{Faker::GameOfThrones.character}, #{Faker::GameOfThrones.character}",
    director: Faker::FamilyGuy.character,
    duration: "#{rand(120..200)} minutes",
    image_file_name: Faker::Avatar.image
  },
  {
    title: "Hitch",
    rating: "PG",
    total_gross: 30000000.00,
    description: "Wow, there's not much I can say about this movie besides how amazing it is. Great cast, great writing, just amazing.",
    released_on: "2006-03-23",
    cast: "#{Faker::GameOfThrones.character}, #{Faker::GameOfThrones.character}, #{Faker::GameOfThrones.character}",
    director: Faker::FamilyGuy.character,
    duration: "#{rand(120..200)} minutes",
    image_file_name: Faker::Avatar.image
  },
  {
    title: "National Treasure",
    rating: "PG-13",
    total_gross: 300000.00,
    description: "Pretty Good... this movie could have done so much more.",
    released_on: "2009-09-23",
    cast: "#{Faker::GameOfThrones.character}, #{Faker::GameOfThrones.character}, #{Faker::GameOfThrones.character}",
    director: Faker::FamilyGuy.character,
    duration: "#{rand(120..200)} minutes",
    image_file_name: Faker::Avatar.image
  },
  {
    title: "Fired Up!",
    rating: "R",
    total_gross: 900060.00,
    description: "SO GOOD. I loved this movie with all my little soul",
    released_on: "2012-02-23",
    cast: "#{Faker::GameOfThrones.character}, #{Faker::GameOfThrones.character}, #{Faker::GameOfThrones.character}",
    director: Faker::FamilyGuy.character,
    duration: "#{rand(120..200)} minutes",
    image_file_name: Faker::Avatar.image
  },
  {
    title: "Friends With Benefits",
    rating: "R",
    total_gross: 40400000.00,
    description: "Justin and Mila crush it in this movie. Seriously.",
    released_on: "2009-01-22",
    cast: "#{Faker::GameOfThrones.character}, #{Faker::GameOfThrones.character}, #{Faker::GameOfThrones.character}",
    director: Faker::FamilyGuy.character,
    duration: "#{rand(120..200)} minutes",
    image_file_name: nil
  }
])

movie = Movie.find_by(title: 'Iron Man')
movie = Movie.find_by(title: 'Superman')

roger =User.create!(name: "Jake Paul", username: "jakepaul", email: "jakepaul@gmail.com", password: "secret", password_confirmation: "secret")
gene = User.create!(name: "Alec Lorraine", username: "alec", email: "alec@gmail.com", password: "secret", password_confirmation: "secret")


Genre.create!(name: "Action")
Genre.create!(name: "Comedy")
Genre.create!(name: "Drama")
Genre.create!(name: "Romance")
Genre.create!(name: "Thriller")
Genre.create!(name: "Fantasy")
Genre.create!(name: "Documentary")
Genre.create!(name: "Adventure")
Genre.create!(name: "Animation")
Genre.create!(name: "Sci-Fi")

movie.reviews.create!(user: roger, stars: 5, comment: "It's a bird, it's a plane, it's a blockbuster!")
movie.reviews.create!(user: roger, stars: 3, comment: "I laughed, I cried, I spilled my popcorn!")
movie.reviews.create!(user: gene, stars: 5, comment: "I'm a better reviewer than he is.")
movie.reviews.create!(user: gene, stars: 4, comment: "It's been years since a movie superhero was this fierce and this funny.")
movie.fans << roger
movie.fans << gene





