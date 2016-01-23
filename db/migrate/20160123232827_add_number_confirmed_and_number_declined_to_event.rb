class AddNumberConfirmedAndNumberDeclinedToEvent < ActiveRecord::Migration
  def change
    add_column :event, :confirmed, :string
    add_column :event, :declined, :string
  end
end
