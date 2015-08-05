class RemoveBrandFromAdverts < ActiveRecord::Migration
  def change
    remove_column :adverts, :brand, :string
    remove_column :adverts, :model, :string
  end
end
