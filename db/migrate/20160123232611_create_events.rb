class CreateEvents < ActiveRecord::Migration
  def change
    create_table :event do |t|
      t.string :title
      t.datetime :start
      t.boolean :food
      t.boolean :swag
      t.boolean :prizes
      t.boolean :infosession

      t.timestamps null: false
    end
  end
end
