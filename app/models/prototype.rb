class Prototype < ApplicationRecord
  validates :title, presence: true,unless: :was_attached?
  validates :catch_copy,presence: true
  validates :concept,presence: true
  validates :image,presence: true

  # アソシエーション
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  
  def was_attached?
    self.image.attached?
  end
end

# | title  | string | null: false |
# | catch_copy| text| null: false |
# | concept | text  | null: false |
# | image   | ActiveStorage | |
# | user   | references   | |