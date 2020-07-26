class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.string :quantity
      t.references :products, foreign_key: true

      t.timestamps
    end
  end
end
