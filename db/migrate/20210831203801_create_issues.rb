class CreateIssues < ActiveRecord::Migration[6.1]
  def change
    create_table :issues do |t|
      t.float :latitude
      t.float :altitude
      t.float :longitude
      t.string :image
      t.string :category
      t.st_point :lonlat, geographic: true

      t.timestamps
    end

    add_index :issues, :lonlat, using: :gist
  end
end
