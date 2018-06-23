class RatingsReviews < ActiveRecord::Migration
  def change
      create_table :reviews do |t|
      t.integer :product_id
      t.string  :name
      t.string  :email
      t.string  :review
      t.decimal  :rating

      t.timestamps null: false
    end
  end
end
