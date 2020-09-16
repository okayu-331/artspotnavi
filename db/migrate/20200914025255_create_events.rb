class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.date :open_date,  null: false
      t.time :open_time,  null: false
      t.time :close_time, null: false
      t.references :exhibition, foreign_key: true
      t.references :organizer, foreign_key: true
      t.timestamps
    end
  end
end
