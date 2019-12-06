class CreateInterpretations < ActiveRecord::Migration[6.0]
  def change
    create_table :interpretations do |t|
      t.text :description
      t.belongs_to :dream, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
