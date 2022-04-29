class CreateDocs < ActiveRecord::Migration[6.1]
  def change
    create_table :docs do |t|
      t.string :name
      t.string :chinese_name
      t.string :year
      t.string :duration
      t.string :poster
      t.string :doc_summary_short
      t.string :doc_summary_long
      t.string :doc_summary_source
      t.string :trailer_link
      t.string :useful_links, default: [], array: true

      t.timestamps
    end
  end
end
