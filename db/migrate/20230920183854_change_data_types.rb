class ChangeDataTypes < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :posts_counter, 'integer USING posts_counter::integer'
  end
end
