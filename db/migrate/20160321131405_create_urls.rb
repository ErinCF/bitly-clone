class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |columns|
      columns.string :url_long
      columns.string :url_short

      columns.timestamps null: false
    end
  end
end
