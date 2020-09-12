class CreateExhibitions < ActiveRecord::Migration[6.0]
  def change
    create_table :exhibitions do |t|
      t.string :title,            null: false
      t.string :subtitle
      t.string :venue,            null: false
      t.text :description
      t.date :start_date,         null: false
      t.date :end_date,           null: false
      t.time :basic_open_time,    null: false
      t.time :basic_close_time,   null: false
      t.string :close_day
      t.string :special_open_day
      t.string :admission,        null: false
      t.string :address,          null: false
      t.string :access
      t.string :phone_number
      t.string :url
      t.integer :prefecture_id,   null: false
      t.references :organizer, foreign_key: true
      t.timestamps
    end
  end
end
