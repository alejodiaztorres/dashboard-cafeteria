class AddDateTimeToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :date_time, :datetime
  end
end
