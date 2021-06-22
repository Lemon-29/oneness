class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites

  def avg_score
    total = 0
    self.comments.each do |comment|
      total += comment.score
    end
    self.comments.length == 0 ? 0 : total / self.comments.length
  end
end
