class AddImageToGarages < ActiveRecord::Migration[5.0]
  def change
    add_column :garages, :image, :string
  end
end
