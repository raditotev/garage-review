class Garage < ApplicationRecord
  mount_uploader :image, ImageUploader
end
