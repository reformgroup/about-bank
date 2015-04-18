class AddSiteToBanks < ActiveRecord::Migration
  def change
    add_column :banks, :website, :string
  end
end
