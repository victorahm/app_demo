class CreateJoinTableRolesMenus < ActiveRecord::Migration[5.2]
  def change
    create_join_table :roles, :menus do |t|
      t.index [:role_id, :menu_id]
      t.index [:menu_id, :role_id]
    end
  end
end
