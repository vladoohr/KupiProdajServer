class RemoveAvatarsFromPhotos < ActiveRecord::Migration[5.0]
  def change
  	remove_column :photos, :avatars
  end
end
