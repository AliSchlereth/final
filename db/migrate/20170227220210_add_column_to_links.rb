class AddColumnToLinks < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :hot_status, :string, default: "reg"
  end
end
