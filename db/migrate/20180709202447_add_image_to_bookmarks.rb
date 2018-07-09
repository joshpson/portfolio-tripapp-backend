class AddImageToBookmarks < ActiveRecord::Migration[5.2]
  def change
    add_column :bookmarks, :image, :string
  end
end
