class AddImageToAdvertisement < ActiveRecord::Migration[5.0]
  def change
    add_column :advertisements, :image, :string
  end
end
