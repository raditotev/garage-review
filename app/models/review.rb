class Review < ApplicationRecord
  belongs_to :user

  validates :rating, :comment, presence: true
  validates :rating, numericality: {
                        only_integer: true,
                        greater_than_or_equal_to: 1,
                        less_than_or_equal_to: 5,
                        message: "should have at least 1 star"
                      }
end
