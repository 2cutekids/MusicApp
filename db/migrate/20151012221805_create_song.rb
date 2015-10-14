class CreateSong < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.references :album, index: true
    end
  end
end
