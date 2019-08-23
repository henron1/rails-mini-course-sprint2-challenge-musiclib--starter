class CreatePlaylist < ActiveRecord::Migration[5.2]
  def change
    create_table :playlists do |t|
      t.string :name
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
