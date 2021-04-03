class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :event_name
      t.date :event_date
      t.text :description
      t.references :user,  :foreign_key => 'creator_id'

      t.timestamps
    end
  end
end
