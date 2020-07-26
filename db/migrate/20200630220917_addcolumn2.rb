class Addcolumn2 < ActiveRecord::Migration[5.2]
  def change
      add_column :sales, :amount, :integer
  end
end
