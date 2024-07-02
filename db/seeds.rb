# frozen_string_literal: true

# add categories
7.times do
  category = Faker::ProgrammingLanguage.unique.name
  Category.create(name: category) unless Category.find_by(name: category)
end

# add user
users_data = [
  {
    encrypted_password: Devise::Encryptor.digest(User, '2`.BpzKqqUK_HZ5Q1h00'),
    email: 'user2@example.com'
  },
  {
    encrypted_password: Devise::Encryptor.digest(User, 'B?J1r+@,P%f7aBLzK$^'),
    email: 'as@example.com'
  }
]
users_data.each do |user_data|
  User.create(user_data) unless User.find_by(email: user_data[:email])
end

# add posts
4.times do
  Post.create(
    title: Faker::Lorem.sentence.chomp('.'),
    body: Faker::Lorem.paragraphs.join("\n\n"),
    creator_id: User.last,
    category_id: Category.all.sample.id
  )
end
