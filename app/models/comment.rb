class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :content, presence: true, length: { minimum: 1, maximum: 1000 }
  validates :score, presence: true # , inclusion: 0..5
end
