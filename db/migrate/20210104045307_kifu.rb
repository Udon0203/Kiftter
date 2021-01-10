class Kifu < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :kif_path, :string
  end
end
