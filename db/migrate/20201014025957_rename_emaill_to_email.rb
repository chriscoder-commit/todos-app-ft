class RenameEmaillToEmail < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :emaill, :email
  end
end
