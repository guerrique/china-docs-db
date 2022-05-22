class AddImgcreditToDirectors < ActiveRecord::Migration[6.1]
  def change
    add_column :directors, :imgcredit, :string
  end
end
