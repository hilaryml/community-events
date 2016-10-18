class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :date
      t.time :time
      t.text :description
      t.string :contact
      t.string :user_id
    end
  end
end
