class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.integer :customer_id, :null => false
      t.integer :provider_id, :null => false
      t.float :total_price, :null => false
      t.timestamps
    end
  end
end
