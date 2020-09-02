class RemoveGgenreFromSongs < ActiveRecord::Migration[5.0]
  def change
    remove_column :songs, :ggenre, :string
  end
end
