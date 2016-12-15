class AddGarageIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :garage, foreign_key: true
  end
end
