class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start_time
      t.boolean :food
      t.boolean :swag
      t.boolean :prizes
      t.integer :confirmed_attendees
      t.integer :declined_attendees

      t.timestamps null: false
    end
  end
end
