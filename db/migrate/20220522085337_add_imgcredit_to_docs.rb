class AddImgcreditToDocs < ActiveRecord::Migration[6.1]
  def change
    add_column :docs, :imgcredit, :string
  end
end
