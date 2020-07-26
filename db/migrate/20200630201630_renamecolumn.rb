class Renamecolumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :sales, :products_id, :product_id
  end
end
