class CreateFanPages < ActiveRecord::Migration
  def change
    create_table :fan_pages do |t|
      t.string :name
      t.string :url
      t.boolean :primary
      t.integer :user_id

      t.timestamps
    end
  end
end
