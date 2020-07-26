class ChangeColumnInTable < ActiveRecord::Migration[5.2]
  def change
    change_column(:sales, :quantity, :integer)
  end
end
