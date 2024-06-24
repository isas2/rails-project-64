# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User'
  has_many :comments, dependent: :delete_all, class_name: 'PostComment'

  validates :title, presence: true
  validates :body, length: { minimum: 50, maximum: 2048 }
end
