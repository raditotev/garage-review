class Garage < ApplicationRecord
  mount_uploader :image, ImageUploader

  searchkick

  has_many :reviews, dependent: :destroy

  validates :name, :address, :phone, :website, :image, presence: true
  validates :address, format: { with: /\A\d+[^,]+,[^,]+, [A-Z]+\d+ \d+[A-Z]+\z/,
                                message: "should be with the following format: 123 Example Rd, London, SW1 2BC" }
  validates :website, format: { with: /\Ahttps?:\/\/.*\z/,
                                message: "should start with a http://" }

end
