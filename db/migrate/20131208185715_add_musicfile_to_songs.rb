class AddMusicfileToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :musicfile, :string
  end
end
