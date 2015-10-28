class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.boolean :public, default: true # sets the default boolean value to true which means topics are by default Public
      t.text :description

      t.timestamps null: false
    end
  end
end
