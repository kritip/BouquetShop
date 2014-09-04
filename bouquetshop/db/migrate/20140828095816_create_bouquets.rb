class CreateBouquets < ActiveRecord::Migration
  def change
    create_table :bouquets do |t|
      t.string :name
      t.string :category
      t.string :arrangement
      t.string :occasion
      t.boolean :h_delivery
      t.integer :price
      t.string :flowers

      t.timestamps
    end
  end
end
