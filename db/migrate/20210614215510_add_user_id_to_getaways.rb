class AddUserIdToGetaways < ActiveRecord::Migration
  def change
    add_column :getaways, :user_id, :integer
  end
end
