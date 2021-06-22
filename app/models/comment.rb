class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :content, presence: true
  validates :score, presence: true # , inclusion: 0..5
end
