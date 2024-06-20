# frozen_string_literal: true

categories = ['Ruby', 'Ruby on Rails', 'JavaScript', 'DevOps', 'Тестирование', 'Новости и объявления', 'ИТ справочник']
categories.each { |category| Category.create(name: category) }

encrypted = Devise::Encryptor.digest(User, 'B?J1r+@,P%f7aBLzK$^')
User.create(email: 'as@example.com', encrypted_password: encrypted)
