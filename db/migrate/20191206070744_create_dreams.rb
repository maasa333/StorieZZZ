class CreateDreams < ActiveRecord::Migration[6.0]
  def change
    create_table :dreams do |t|
      t.string :category
      t.text :description
      t.date :date
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
