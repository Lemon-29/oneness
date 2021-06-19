class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites

  def avg_rate
    total = 0
    avg = 0
    self.comments.each do |comment|
      total += comment.rate
    end
    avg / self.comments.length
  end
end
