class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :datetime
      t.text :description
      t.string :contact
      t.string :user_id
    end
  end
end
