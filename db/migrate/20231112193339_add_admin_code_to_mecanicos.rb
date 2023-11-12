class AddAdminCodeToMecanicos < ActiveRecord::Migration[7.1]
  def change
    add_column :mecanicos, :adminCode, :integer, default: 0
  end
end
