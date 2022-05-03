class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.string :description
      t.string :url
      t.references :director, foreign_key: true
      t.timestamps
    end
  end
end
