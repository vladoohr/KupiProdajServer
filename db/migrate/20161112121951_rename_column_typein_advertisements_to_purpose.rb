class RenameColumnTypeinAdvertisementsToPurpose < ActiveRecord::Migration[5.0]
  def change
  	rename_column :advertisements, :type, :purpose
  end
end
