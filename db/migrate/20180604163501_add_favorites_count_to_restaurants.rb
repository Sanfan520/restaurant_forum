class AddFavoritesCountToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :favorites_count, :integer, default: 0
    #計算關聯物件數量的欄位，慣例會命名為 {table_name}_count
  end
end
