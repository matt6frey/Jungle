class RatingsReviews < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :product_id
      t.decimal  :rating

      t.timestamps null: false
  end

    create_table :reviews do |t|
      t.integer :product_id
      t.string  :name
      t.string  :email
      t.string  :review

      t.timestamps null: false
    end
  end
end
