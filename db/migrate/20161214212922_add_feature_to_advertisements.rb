class AddFeatureToAdvertisements < ActiveRecord::Migration[5.0]
  def change
  	add_column :advertisements, :featured, :boolean, default: false
  end
end
