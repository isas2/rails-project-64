# frozen_string_literal: true

# add categories
categories = [
  'Ruby',
  'Ruby on Rails',
  'JavaScript',
  'DevOps',
  'Тестирование',
  'Новости и объявления',
  'ИТ справочник'
]
categories.each do |category|
  Category.create(name: category) unless Category.find_by(name: category)
end

# add user
user = {
  encrypted_password: Devise::Encryptor.digest(User, 'B?J1r+@,P%f7aBLzK$^'),
  email: 'as@example.com'
}
unless User.find_by(email: user[:email])
  User.create(user)
end
