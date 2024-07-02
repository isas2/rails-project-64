# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User'
  has_many :comments, dependent: :delete_all, class_name: 'PostComment'
  has_many :likes, dependent: :delete_all, inverse_of: :post, class_name: 'PostLike'

  validates :title, presence: true
  validates :body, length: { minimum: 5, maximum: 2048 }
end
