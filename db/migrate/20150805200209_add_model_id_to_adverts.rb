class AddModelIdToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :model_id, :integer
  end
end
