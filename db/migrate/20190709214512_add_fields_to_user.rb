class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :company, :string
    add_column :users, :status, :boolean, default: true
  end
end
