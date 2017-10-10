def movie_attributes(overrides = {})
  {
    title: "Iron Man",
    rating: "PG-13",
    total_gross: 318412101.00,
    description: "Tony Stark builds an armored suit to fight the throes of evil",
    released_on: "2008-05-02",
    cast: "Robert Downey Jr., Gwyneth Paltrow and Terrence Howard",
    director: "Jon Favreau",
    duration: "126 min",
    image: open("#{Rails.root}/app/assets/images/ironman.jpg")
  }.merge(overrides)
end

def review_attributes(overrides = {})
  {
    stars: 3,
    comment: "I laughed, I cried, I spilled my popcorn!",
    user_id: 1
  }.merge(overrides)
end

def user_attributes(overrides = {})
  {
    name: Faker::Name.name,
    email: Faker::Internet.email,
    username: Faker::Internet.user_name(Faker::Name.first_name),
    password: "secret",
    password_confirmation: "secret",
    admin: true
  }.merge(overrides)
end