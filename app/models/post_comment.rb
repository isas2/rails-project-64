# frozen_string_literal: true

class PostComment < ApplicationRecord
  has_ancestry
  validates :content, presence: true
  belongs_to :user
  belongs_to :post
end
