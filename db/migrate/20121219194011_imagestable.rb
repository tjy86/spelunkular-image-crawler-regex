class Imagestable < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url
      t.integer :depth
      t.timestamps
    end
  end
end
