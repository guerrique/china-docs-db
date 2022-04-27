class CreateDirectors < ActiveRecord::Migration[6.1]
  def change
    create_table :directors do |t|
      t.string :name
      t.string :bio_short
      t.string :bio_long
      t.string :birth_year
      t.string :death_year
      t.string :bio_source
      t.string :useful_links, default: [], array: true
      t.timestamps
    end
  end
end
