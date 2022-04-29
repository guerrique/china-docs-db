class CreateGoodlinks < ActiveRecord::Migration[6.1]
  def change
    create_table :goodlinks do |t|
      t.string :description
      t.string :link
      t.references :doc, null: false, foreign_key: true
      t.references :director, null: false, foreign_key: true

      t.timestamps
    end
  end
end
