class Linkstable < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :depth
      t.string :url
      t.timestamps
    end
  end
end
