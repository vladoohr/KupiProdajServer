class AddForeignKeysToAdvertisement < ActiveRecord::Migration[5.0]
  def change
  	add_column :advertisements, :user_id, :integer
  	add_column :advertisements, :category_id, :integer
  	add_column :advertisements, :city_id, :integer
  end
end
