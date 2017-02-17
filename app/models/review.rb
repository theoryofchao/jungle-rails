class Review < ActiveRecord::Base

  belongs_to :product, required: true
  belongs_to :user, required: true

  validates :product_id, :user_id, :rating, presence: true
  validates :product_id, uniqueness: { scope: :user_id }
  validates :rating, numericality: {only_integer: true, less_than_or_equal_to: 5, greater_than_or_equal_to: 1}
end
