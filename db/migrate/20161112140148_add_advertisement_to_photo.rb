class AddAdvertisementToPhoto < ActiveRecord::Migration[5.0]
  def change
  	add_column :photos, :advertisement_id, :integer
  end
end
