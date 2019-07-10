class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :label, null: false
      t.string :url, null: false
      t.belongs_to :parent, foreign_key: { to_table: :menus }

      t.timestamps
    end
  end
end
