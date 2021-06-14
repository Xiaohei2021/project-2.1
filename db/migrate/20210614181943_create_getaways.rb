class CreateGetaways < ActiveRecord::Migration
  def change
    create_table :getaways do |t|
      t.string :destination
      t.string :advantures
      t.string :duration_of_stay
      t.string :season_to_visit
      t.string :location
      t.string :saving_required
      t.timestamps null: false
    end
  end
end
