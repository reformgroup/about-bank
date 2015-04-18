class AddShortNameToBanks < ActiveRecord::Migration
  def change
    add_column :banks, :short_name, :string
  end
end
