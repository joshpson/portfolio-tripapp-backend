class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.string :category
      t.string :title
      t.string :description
      t.string :address
      t.string :api_service
      t.string :api_id
      t.integer :trip_id
      t.timestamps
    end
  end
end
