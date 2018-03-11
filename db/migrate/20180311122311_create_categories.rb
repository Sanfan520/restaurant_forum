class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.timestamps
    end
    #預設的create_table方法


    add_column :restaurants, :category_id, :integer
    #可再呼叫其他的migration方法
  end
end
