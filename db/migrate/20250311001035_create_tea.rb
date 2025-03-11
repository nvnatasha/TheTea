class CreateTea < ActiveRecord::Migration[7.1]
  def change
    create_table :teas do |t|
      t.string :name
      t.string :description
      t.float :temp
      t.float :brew_time

      t.timestamps
    end
  end
end
