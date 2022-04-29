class AddAwardToDoc < ActiveRecord::Migration[6.1]
  def change
    add_reference :awards, :doc, foreign_key: true
  end
end
