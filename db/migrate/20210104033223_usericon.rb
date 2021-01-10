class Usericon < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :icon_path, :string
  end
end
