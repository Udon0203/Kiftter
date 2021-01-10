class Remkifu < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :kifu, :string
  end
end
