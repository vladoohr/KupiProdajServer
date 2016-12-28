class RemoveImageFromAdvertisements < ActiveRecord::Migration[5.0]
  def change
  	remove_column :advertisements, :image
  end
end
