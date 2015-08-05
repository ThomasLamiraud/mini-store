class CreateAdverts < ActiveRecord::Migration
  def change
    create_table :adverts do |t|
    	t.string :model
    	t.string :brand
    	t.integer :price
    	t.string :state
    	t.string :status
      t.timestamps null: false
    end
  end
end
