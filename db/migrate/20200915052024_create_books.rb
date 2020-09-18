class CreateBooks < ActiveRecord::Migration[5.0]
  def up
    create_table :books do |t|

      t.string "title", :limit => 50
      t.string "author", :limit => 30
      t.string "genre", :limit => 20
      t.integer "price"
      t.string "published_date", :limit => 20
      t.timestamps
    end
  end

  def down
    drop_table :books
  end
end
